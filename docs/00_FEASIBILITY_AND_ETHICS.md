# Fase 02: Studi Kelayakan (Feasibility Study) & Etika Medis AI

**Standar Evaluasi:** TELOS Framework (Technical, Economic, Legal, Operational, Schedule)  

---

## 1. Analisis Kelayakan Komprehensif (TELOS)

### A. Technical Feasibility (Kelayakan Teknis)
* **Tantangan Utama:** LLM (seperti GPT, Gemini, Llama) memiliki sifat stokastik (probabilistik) yang rentan berhalusinasi saat menghitung angka nutrisi dan rentan meloloskan alergen dalam prompt panjang.
* **Solusi Rekayasa:** Menerapkan arsitektur **Neuro-Simbolik**:
  * Komputasi matematika Z-score WHO 2006 dan filter biner alergen dieksekusi 100% oleh kode logika pasti (*deterministic engine*) dan query database PostgreSQL.
  * LLM hanya berperan sebagai *Natural Language Interface* yang menerjemahkan angka kaku menjadi kalimat empati berbahasa Indonesia.
* **Tingkat Kesiapan Teknologi (TRL):** Berada di **TRL 7** (Demonstrasi prototipe sistem terintegrasi di lingkungan operasional nyata).

### B. Economic & Financial Feasibility (Kelayakan Finansial & Biaya)
* **Biaya Pengguna Akhir:** Rp0,- (Digital Public Good untuk masyarakat dan kader Posyandu).
* **Efisiensi Anggaran Pangan Keluarga:** Menghemat pengeluaran belanja hingga 70% dengan mengganti sumber protein hewani impor (salmon/daging impor Rp150.000–300.000/kg) menjadi ikan kembung lokal (Rp35.000–45.000/kg) dengan densitas Omega-3 yang terbukti lebih tinggi.
* **Biaya Operasional Infrastruktur:** Berjalan efisien di VPS Cloud Linux mandiri dengan konsumsi RAM < 500 MB, menjaga biaya hosting di bawah Rp100.000/bulan.

### C. Legal, Ethical & Privacy Compliance (Kepatuhan Hukum & Etika)
* **Kepatuhan UU No. 27 Tahun 2022 tentang Perlindungan Data Pribadi (UU PDP):**
  * Data identitas balita disamarkan (*PII Pseudonymization*) menjadi `child_alias` (inisial/ID acak). NIK dan nama lengkap anak tidak disimpan dalam format teks terbuka (*plaintext*).
  * Data riwayat medis anak tidak dikirim ke API model bahasa pihak ketiga tanpa sanitasi data.
* **Kepatuhan Standar Medis Kemenkes RI:**
  * Mengadopsi Permenkes No. 2 Tahun 2020 tentang Standar Antropometri Anak dan Permenkes No. 28 Tahun 2019 tentang Angka Kecukupan Gizi (AKG).
* **Medical Disclaimer & Batasan Hukum:**
  * Sistem memuat klausul sanggahan medis eksplisit (*Medical Disclaimer*): NutriShield adalah alat bantu skrining gizi pencegahan dini, bukan pengganti diagnosis klinis definitif dari dokter spesialis anak.

### D. Operational Feasibility (Kelayakan Operasional di Lapangan)
* **Kondisi Lapangan Kader:** Sebagian besar kader menggunakan smartphone kelas menengah ke bawah dengan koneksi internet 3G/4G yang fluktuatif.
* **Solusi UI/UX:** Web dibangun *mobile-first*, ukuran bundle JavaScript sangat ringan (< 200 KB gzipped), dan antarmuka dirancang dengan tombol besar yang mudah ditekan satu tangan saat menimbang balita.

### E. Schedule Feasibility (Kelayakan Jadwal 14 Hari)
* Dengan pemisahan monorepo yang jelas dan backlog terstruktur, target peluncuran versi produksi dalam 14 hari sangat realistis dan terukur.
