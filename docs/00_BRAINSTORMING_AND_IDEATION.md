# Fase 01: Brainstorming, Ideation & Problem Discovery

**Metodologi:** Design Thinking (Empathize, Define, Ideate) + Root Cause Analysis (5 Whys)  
**Partisipan Utama:**
* **Muhammad Hisyam Alfaris (Kavleri)**: Tech & Security Lead
* **Salsabila Putri Halimi (putrihalimi)**: Data & Public Impact Lead

---

## 1. Problem Discovery: Root Cause Analysis (5 Whys)

Mengapa prevalensi stunting anak Indonesia masih tinggi (21.5% SSGI) dan sulit turun ke target nasional 14%?

```text
Problem: 1 dari 5 balita di Indonesia mengalami gagal tumbuh (stunting) dan defisiensi mikronutrien.
  │
  ├── [Why 1?]: Mengapa anak-anak tersebut tidak mendapatkan nutrisi yang cukup di 1.000 HPK?
  │     └── Karena pola makan keluarga rendah protein hewani dan asam lemak esensial (DHA/EPA).
  │
  ├── [Why 2?]: Mengapa orang tua tidak memberikan protein hewani bermutu tinggi?
  │     └── Karena ada persepsi keliru bahwa makanan bergizi tinggi itu "harus mahal" (misal: ikan salmon, daging merah premium, susu formula impor).
  │
  ├── [Why 3?]: Mengapa persepsi "makan sehat itu mahal" terus bertahan di masyarakat?
  │     └── Karena rendahnya literasi gizi lokal; informasi di media sosial dipenuhi mitos, hoaks, dan promosi produk komersial impor.
  │
  ├── [Why 4?]: Mengapa fasilitas kesehatan lini pertama (Posyandu) belum optimal mematahkan mitos ini?
  │     └── Kader Posyandu kelelahan dengan pencatatan manual di buku folio fisik, waktu habis untuk administrasi, sehingga tidak sempat melakukan edukasi personal.
  │
  └── [Why 5? - Root Cause]: Belum ada alat bantu cerdas yang mampu:
        (1) Menganalisis antropometri balita secara otomatis dan bebas kesalahan hitung,
        (2) Mengonversi data gizi laboratorium resmi (TKPI Kemenkes) menjadi rekomendasi menu pangan lokal murah (< Rp25.000/hari),
        (3) Memfilter alergi anak secara mutlak tanpa halusinasi medis.
```

---

## 2. Empathy Mapping (Membedah Realitas Lapangan)

### A. Persona: Bunda Ayu (Ibu Balita 14 Bulan di Desa / Pinggiran Kota)
* **Says (Apa yang dikatakan):**
  * *"Uang belanja harian saya cuma Rp30.000 untuk sekeluarga, mana sanggup beli salmon atau daging sapi tiap hari?"*
  * *"Anak saya gatal-gatal kalau makan telur, saya bingung mau kasih lauk apa lagi yang murah."*
* **Thinks (Apa yang dipikirkan):**
  * Takut anaknya dibilang stunting oleh tetangga (ada stigma sosial).
  * Khawatir salah memberi makanan yang memicu alergi kambuh.
* **Does (Apa yang dilakukan):**
  * Memberi makan seadanya: nasi kuah kecap, kerupuk, atau mie instan.
  * Membawa anak ke Posyandu sebulan sekali tapi tidak mengerti arti garis grafik di buku KIA/KMS.
* **Feels (Apa yang dirasakan):**
  * Cemas, kewalahan secara finansial, dan merasa bersalah terhadap masa depan anak.

### B. Persona: Ibu Warsini (Kader Posyandu, 46 Tahun)
* **Says (Apa yang dikatakan):**
  * *"Hari buka Posyandu cuma 3 jam, tapi yang antre 50 balita. Pusing nulis di buku register!"*
  * *"Kadang baru sadar anak si Ibu A beratnya turun terus setelah 3 bulan, padahal sudah terlambat."*
* **Thinks (Apa yang dipikirkan):**
  * Ingin ada aplikasi sederhana di HP yang tidak lemot dan tidak rumit.
  * Ingin langsung tahu anak mana yang "Merah" (butuh rujukan segera ke Puskesmas).
* **Does (Apa yang dilakukan):**
  * Menimbang balita dengan dacin/timbangan bayi, mengukur panjang badan dengan papan ukur kayu.
  * Menulis manual di buku KMS fisik dan mengisi laporan bulanan SKDN.
* **Feels (Apa yang dirasakan):**
  * Lelah fisik dan mental, takut salah hitung usia atau salah plot titik kurva.

---

## 3. Value Proposition Canvas (VPC)

```text
+------------------------------------+    +------------------------------------+
|          VALUE PROPOSITION         |    |           CUSTOMER PROFILE         |
|             (NutriShield)          |    |          (Keluarga & Kader)        |
+------------------------------------+    +------------------------------------+
| Products & Services:               |    | Customer Jobs:                     |
| • Kalkulator Antropometri WHO LMS  |    | • Menimbang & mengukur balita      |
| • Database Pangan Lokal Nusantara  |    | • Menyusun menu harian keluarga    |
| • Hard Guardrail Anti-Alergi       |    | • Mencegah stunting & gizi buruk   |
| • Generator Laporan PDF 12 Halaman |    |                                    |
| • Dashboard Deteksi Dini 2T        |    |                                    |
+------------------------------------+    +------------------------------------+
| Pain Relievers:                    |    | Pains:                             |
| • Zero Medical Hallucination (aman)|    | • Uang belanja sangat terbatas     |
| • Menemukan menu murah (< Rp25rb)  |    | • Bingung alergi makanan anak      |
| • Eliminasi pencatatan manual Posy |    | • Antrean panjang & data manual    |
| • Penjelasan gizi bahasa empati    |    | • Stigma & ketidaktahuan klinis    |
+------------------------------------+    +------------------------------------+
| Gain Creators:                     |    | Gains:                             |
| • Ikan Kembung Omega-3 > Salmon    |    | • Anak tumbuh tinggi & cerdas      |
| • Status gizi anak langsung jelas  |    | • Kepastian menu aman alergi       |
| • Rujukan Puskesmas cepat & tepat  |    | • Kader kerja cepat & rapi         |
| • Sertifikat Laporan Medis Resmi   |    | • Hemat anggaran belanja harian    |
+------------------------------------+    +------------------------------------+
```

---

## 4. Sintesis Sesi Ideation (Brainstorming Hisyam & Salsa)

Berdasarkan rekaman diskusi awal tim Shadow AI:
1. **Pilar Keamanan & DevSecOps (Mas Hisyam)**:
   * AI Generatif (LLM) **TIDAK BOLEH** diberi wewenang menghitung dosis atau menentukan ada/tidaknya alergi.
   * Keamanan data anak (PII) harus dilindungi secara ketat sesuai UU Perlindungan Data Pribadi (UU PDP).
   * Sistem harus berjalan di server mandiri (*sovereign VPS*) tanpa ketergantungan API pihak ketiga yang membocorkan data medis keluarga.
2. **Pilar Kebijakan Publik & Data Gizi (Mbak Salsa)**:
   * Mematahkan hegemoni bahan pangan impor; fokus 100% pada **Pangan Lokal Nusantara** berbasis data uji laboratorium Kemenkes RI (TKPI).
   * Menyorot *superfood* lokal: **Ikan Kembung** (Omega-3 2.2g vs Salmon 1.4g), **Daun Kelor** (Zat besi & kalsium tinggi), **Tempe** (Protein nabati prebiotik), **Telur Puyuh**, dan **Jambu Biji Merah**.
   * Output harus berbentuk artefak legal yang diakui faskes: **Laporan Medis 12 Halaman Resmi** lengkap dengan verifikasi kriptografi.
