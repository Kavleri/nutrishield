# Fase 03: Pemetaan Alur Pengguna (User Journey Mapping)

Perbandingan alur proses nyata di Posyandu dan rumah tangga: kondisi konvensional saat ini (*As-Is*) vs kondisi dengan NutriShield (*To-Be*).

---

## 1. Alur Pemeriksaan Posyandu & Skrining Stunting

```mermaid
graph TD
    subgraph KONDISI SAAT INI (As-Is: Penuh Hambatan)
        A1[Ibu Datang Bawa Balita] --> B1[Antre Panjang di Meja Pendaftaran]
        B1 --> C1[Penimbangan Dacin & Ukur Tinggi Kayu]
        C1 --> D1[Kader Menulis Manual di Buku KMS Folio]
        D1 --> E1{Kader Salah Plot / Terlewat?}
        E1 -->|Ya| F1[Anak Stunting Terabaikan Berbulan-bulan]
        E1 -->|Tidak| G1[Edukasi Singkat Terburu-buru Karena Antrean]
    end

    subgraph DENGAN NUTRISHIELD (To-Be: Cepat, Presisi & Otomatis)
        A2[Ibu Datang Bawa Balita] --> B2[Kader Buka nutrishield.web.id/posyandu]
        B2 --> C2[Input Cepat BB & TB via Smartphone Kader]
        C2 --> D2[Sistem Hitung Otomatis WHO Z-Score < 50ms]
        D2 --> E2{Ada Sinyal Bahaya / 2T?}
        E2 -->|Merah/Kuning| F2[Alert Rujukan Otomatis + Generate PDF 12 Halaman]
        E2 -->|Hijau/Normal| G2[Rekomendasi Menu Lokal Murah Sesuai Usia]
        F2 --> H2[Ibu Bawa PDF Resmi Langsung ke Puskesmas]
    end
```

---

## 2. Rincian Titik Sentuh (*Touchpoints*) & Emosi Pengguna

| Tahapan Alur | Aksi Pengguna (User Actions) | Titik Sentuh (*Touchpoint*) | Titik Emosi (*Emotion*) | Masalah Nyata (*Pain Points*) | Solusi Inovasi NutriShield |
| :--- | :--- | :--- | :---: | :--- | :--- |
| **1. Pengukuran** | Menimbang berat & mengukur panjang badan balita. | Alat timbang dacin / papan ukur. | 😐 Cemas / Dingin | Anak menangis, kader buru-buru, angka dicatat manual di sobekan kertas. | Form input responsif sekali klik dengan tombol angka besar di layar HP kader. |
| **2. Analisis Klinis** | Menghitung usia bulan dan menarik garis di kurva KMS. | Buku KIA / KMS fisik. | 😣 Bingung / Ragu | Rumit menghitung selisih tanggal lahir, rawan salah plot titik kurva. | Komputasi deterministik LMS Z-Score instan, menampilkan Speedometer warna Kemenkes. |
| **3. Konsultasi Menu** | Bertanya menu bergizi apa yang aman dan murah. | Obrolan lisan dengan kader. | 😟 Frustrasi | Kader sering menyarankan menu generik tanpa memperhatikan alergi atau daya beli. | Rekomendasi menu 7 hari berbasis pangan lokal TKPI (< Rp25.000) bebas alergen. |
| **4. Rujukan Faskes** | Membawa anak ke Puskesmas jika berat badan tidak naik (2T). | Surat rujukan kertas biasa. | 😰 Takut / Stres | Surat rujukan manual sering hilang, data riwayat penimbangan tidak terbaca dokter. | Penerbitan Laporan Medis 12 Halaman resmi berstempel SHA-256 dan grafik kurva lengkap. |
