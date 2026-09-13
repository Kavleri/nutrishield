# Software Requirements Specification (SRS): NutriShield

**Standar Acuan:** IEEE 830 / ISO/IEC/IEEE 29148  
**Sistem Target:** Web Application (`nutrishield.web.id`)  

---

## 1. User Personas

1. **Persona 1: Bunda Ayu (Ibu Balita, 28 Tahun, Sub-urban)**
   * *Pain Point*: Bingung membaca kurva KMS fisik di Posyandu, cemas anaknya stunting tapi anggaran bulanan terbatas, anaknya alergi telur dan seafood.
   * *Goal*: Ingin tahu status gizi anak secara instan, rekomendasi menu murah berbasis pasar lokal, dan kepastian bebas alergi.
2. **Persona 2: Ibu Warsini (Kader Posyandu Desa, 46 Tahun)**
   * *Pain Point*: Pusing mencatat puluhan balita di buku register folio, sering terlewat mendeteksi anak yang berat badannya tidak naik 2 bulan (2T).
   * *Goal*: Input data cepat lewat smartphone/tablet, visualisasi status merah/kuning/hijau otomatis, dan ekspor laporan rekap siap kirim ke Puskesmas.
3. **Persona 3: Dewan Juri Hackathon & Auditor Keamanan**
   * *Pain Point*: Ragu terhadap klaim AI kesehatan ("apakah ini cuma chatbot halusinasi?").
   * *Goal*: Ingin melihat audit trail transparan, pembuktian guardrail deterministik, dan standar keamanan data anak (PII).

---

## 2. Functional Requirements (FR) & Prioritas MoSCoW

| ID | Kategori | Deskripsi Kebutuhan Fungsional | MoSCoW |
| :--- | :--- | :--- | :---: |
| **FR-01** | Antropometri | Sistem WAJIB menghitung Z-score baku WHO 2006 (BB/U, TB/U, BB/TB) menggunakan formula LMS untuk balita 0–59 bulan secara deterministik. | **Must Have** |
| **FR-02** | Status Gizi | Sistem WAJIB mengkategorikan status gizi anak ke dalam 4 tingkatan standar Kemenkes: Gizi Buruk (<-3 SD), Gizi Kurang (-3 s/d <-2 SD), Gizi Baik (-2 s/d +1 SD), Berisiko Gizi Lebih (>+1 SD). | **Must Have** |
| **FR-03** | Guardrail Alergi | Sistem WAJIB memfilter dan mengeliminasi secara mutlak bahan pangan pemicu alergi pengguna (telur, susu sapi, ikan laut, kacang, gluten) di level database sebelum diproses oleh AI. | **Must Have** |
| **FR-04** | Pangan Lokal TKPI | Sistem WAJIB menyediakan basis data pangan lokal Nusantara berdensitas gizi tinggi (Ikan Kembung, Daun Kelor, Tempe, Hati Ayam) dari sumber resmi TKPI Kemenkes. | **Must Have** |
| **FR-05** | Meal Planner | Sistem WAJIB menghasilkan rekomendasi rencana menu makan 7 hari berbasis pangan lokal terjangkau (< Rp25.000/hari) yang memenuhi target kalori & protein anak. | **Must Have** |
| **FR-06** | Laporan PDF 12 Halaman | Sistem WAJIB menyediakan fitur unduh laporan medis resmi 12 halaman berformat PDF dengan ReportLab lengkap dengan grafik, tabel TKPI, dan verifikasi SHA-256. | **Must Have** |
| **FR-07** | Visual Kurva KMS | Sistem HARUS menampilkan grafik kurva pertumbuhan WHO interaktif (panjang/tinggi vs umur, berat vs umur) dengan penanda koordinat anak pengguna. | **Should Have** |
| **FR-08** | Smart Comparator | Sistem HARUS menyediakan slider perbandingan nutrisi dan biaya antara pangan lokal vs pangan impor (contoh: Ikan Kembung vs Salmon). | **Should Have** |
| **FR-09** | Dashboard Posyandu | Sistem HARUS menyediakan portal kader (`/posyandu`) untuk input batch data balita se-RT/RW dan deteksi dini status peringatan 2T. | **Should Have** |
| **FR-10** | Habit Tracker | Sistem DAPAT menyediakan checklist kebiasaan 1.000 HPK (berjemur pagi 15 menit, konsumsi tablet tambah darah ibu, imunisasi dasar). | **Could Have** |
| **FR-11** | Juri Showcase | Sistem DAPAT menyediakan halaman `/architecture` yang mendemokan interaksi live guardrail vs LLM untuk transparansi penilaian. | **Could Have** |

---

## 3. Non-Functional Requirements (NFR)

* **NFR-01 (Performance & Latency):** Waktu respon halaman (*First Contentful Paint*) < 1.0 detik; waktu eksekusi kalkulasi Z-score < 50 milidetik; beban memori runtime server < 300 MB RAM.
* **NFR-02 (Data Security & PII Protection):** Informasi pribadi (nama anak, NIK, alamat spesifik) disamarkan/diredaksi sebelum diteruskan ke model bahasa atau log eksternal.
* **NFR-03 (Zero Medical Hallucination):** 0% toleransi halusinasi pada dosis kalori, formula Z-score, dan bahan alergi. Komputasi medis dilakukan 100% oleh kode deterministik.
* **NFR-04 (Accessibility & Responsiveness):** Tampilan responsif di layar mobile (360px) hingga desktop (1920px), memenuhi rasio kontras warna WCAG 2.1 Level AAA.
* **NFR-05 (Availability & Reliability):** Target uptime service di Cloud VPS mencapai 99.5% dengan auto-restart via Systemd.
