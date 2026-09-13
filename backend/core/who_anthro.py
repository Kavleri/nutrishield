"""
WHO Child Growth Standards (2006) - LMS Formulation
Reference: World Health Organization & Permenkes No. 2 Tahun 2020.
Zero-hallucination deterministic calculation.
"""
from typing import Dict, Any

def calculate_zscore(measurement: float, l: float, m: float, s: float) -> float:
    """
    Computes anthropometric Z-score using LMS Box-Cox power transform.
    Formula:
      Z = ((measurement / M)^L - 1) / (L * S)  if L != 0
      Z = ln(measurement / M) / S             if L == 0
    """
    if measurement <= 0 or m <= 0 or s <= 0:
        raise ValueError("Invalid parameters for LMS calculation")
    
    if abs(l) > 0.0001:
        z = ((measurement / m) ** l - 1.0) / (l * s)
    else:
        import math
        z = math.log(measurement / m) / s
    
    # WHO standard flags extreme values beyond +/- 3 SD for restricted scaling
    if z > 3.0:
        sd3_pos = m * ((1.0 + l * s * 3.0) ** (1.0 / l)) if abs(l) > 0.0001 else m * math.exp(3.0 * s)
        sd23_diff = sd3_pos - (m * ((1.0 + l * s * 2.0) ** (1.0 / l)) if abs(l) > 0.0001 else m * math.exp(2.0 * s))
        z = 3.0 + (measurement - sd3_pos) / sd23_diff
    elif z < -3.0:
        sd3_neg = m * ((1.0 - l * s * 3.0) ** (1.0 / l)) if abs(l) > 0.0001 else m * math.exp(-3.0 * s)
        sd23_diff = (m * ((1.0 - l * s * 2.0) ** (1.0 / l)) if abs(l) > 0.0001 else m * math.exp(-2.0 * s)) - sd3_neg
        z = -3.0 + (measurement - sd3_neg) / sd23_diff

    return round(z, 2)


def classify_waz(z: float) -> Dict[str, Any]:
    """Berat Badan menurut Umur (BB/U) classification."""
    if z < -3.0:
        return {"status": "Berat Badan Sangat Kurang (Severely Underweight)", "code": "severely_underweight", "color": "#EF4444", "action": "Rujuk segera ke RSUD / Dokter Spesialis Anak"}
    elif z < -2.0:
        return {"status": "Berat Badan Kurang (Underweight)", "code": "underweight", "color": "#F59E0B", "action": "Intervensi pangan lokal kaya kalori & protein hewani (Ikan Kembung, Telur, Hati Ayam)"}
    elif z <= 1.0:
        return {"status": "Berat Badan Normal", "code": "normal", "color": "#10B981", "action": "Pertahankan pola makan seimbang 1.000 HPK"}
    else:
        return {"status": "Risiko Berat Badan Lebih", "code": "overweight_risk", "color": "#3B82F6", "action": "Evaluasi konsumsi gula dan karbohidrat olahan"}


def classify_haz(z: float) -> Dict[str, Any]:
    """Tinggi Badan menurut Umur (TB/U) classification (Indikator Stunting)."""
    if z < -3.0:
        return {"status": "Sangat Pendek (Severely Stunted)", "code": "severely_stunted", "color": "#EF4444", "action": "Prioritas rujukan klinis stunting kronis dan pendampingan gizi intensif"}
    elif z < -2.0:
        return {"status": "Pendek (Stunted)", "code": "stunted", "color": "#F59E0B", "action": "Intervensi kejar tinggi badan dengan protein hewani & stimulasi kalsium/zinc alami"}
    elif z <= 3.0:
        return {"status": "Tinggi Badan Normal", "code": "normal", "color": "#10B981", "action": "Pertumbuhan linier optimal"}
    else:
        return {"status": "Tinggi", "code": "tall", "color": "#8B5CF6", "action": "Pertumbuhan di atas rata-rata populasi"}
