# Project Charter: NutriShield Platform (`nutrishield.web.id`)

**Versi Dokumen:** 1.0.0  
**Tanggal Pengesahan:** 13 September 2026  
**Status Proyek:** Active Execution (Sprint 1)  

---

## 1. Identitas & Latar Belakang Proyek

* **Nama Produk / Platform:** NutriShield (Domain: `nutrishield.web.id`)
* **Nama Tim Pengembang:** Shadow AI
* **Kategori Solusi:** Agentic AI for Public Health, Medical Safety & Child Nutrition
* **Afiliasi Strategis:** Selaras dengan Program Nasional Pencegahan Stunting (Target Prevalensi 14%) dan Program Makan Bergizi Gratis (MBG).

### Masalah Utama (Problem Statement)
1. **Disinformasi Gizi & Mitos Pangan**: Tingginya angka stunting di Indonesia (1 dari 5 balita) diperparah oleh anggapan keliru bahwa gizi tinggi harus mahal (misal: salmon impor), padahal pangan lokal Nusantara (ikan kembung, daun kelor, tempe) memiliki densitas nutrisi yang jauh lebih unggul dengan harga 1/5-nya.
2. **Bahaya Halusinasi AI Medis**: Chatbot AI generatif konvensional sering berhalusinasi saat menghitung dosis, kalori, dan kandungan alergen, yang berakibat fatal bagi keselamatan balita.
3. **Beban Administratif Kader Posyandu**: Kader di lapangan masih merekap antropometri balita secara manual, lambat mendeteksi status 2T (berat badan tidak naik 2 bulan berturut-turut), dan kesulitan menerbitkan rujukan formal.

---

## 2. Tujuan Strategis (Objectives & Key Results - OKR)

* **Objective 1 (Inovasi Rekayasa Perangkat Lunak):** Membangun platform agen cerdas neuro-simbolik pertama di Indonesia yang menggabungkan *deterministic medical guardrail* (zero hallucination) dengan natural language interface.
  * *KR 1.1*: Akurasi perhitungan Z-score antropometri WHO 2006 mencapai 100% identik terhadap tabel baku Kemenkes RI.
  * *KR 1.2*: Tingkat kebocoran alergen (*allergen leakage rate*) bernilai 0.00% melalui filter biner di level database.
* **Objective 2 (Dampak Sosial & Publik):** Memberdayakan 1.000+ keluarga dan kader Posyandu melalui transparansi data gizi pangan lokal berbiaya terjangkau (< Rp25.000/hari).
  * *KR 2.1*: Menyediakan katalog perbandingan 50+ pangan lokal TKPI Kemenkes terindeks.
  * *KR 2.2*: Menerbitkan laporan medis klinis 12 halaman berformat PDF resmi terverifikasi hash SHA-256.

---

## 3. Ruang Lingkup Proyek (Scope Management)

### Dalam Ruang Lingkup (In-Scope):
1. **Frontend**: Web App responsif (Next.js 14+ TypeScript, Vanilla CSS modern, Plus Jakarta Sans) dengan 3 persona: Portal Keluarga, Dashboard Kader Posyandu, dan Architecture Transparency Hub.
2. **Deterministic Engine**: Modul perhitungan LMS Z-score (BB/U, TB/U, BB/TB), filter eliminasi alergen, dan optimasi budget menu 7 hari.
3. **Data Intelligence**: Basis data lokal SQLite terindeks berbasis Tabel Komposisi Pangan Indonesia (TKPI) Kemenkes.
4. **Agentic Actions**: Generator PDF 12 halaman ReportLab terintegrasi, notifikasi status 2T untuk kader, dan visualisasi kurva KMS interaktif.
5. **Deployment & DevSecOps**: Hosting di Cloud VPS Linux mandiri, Nginx reverse proxy, SSL Let's Encrypt di domain `nutrishield.web.id`, dan redaksi PII.

### Di Luar Ruang Lingkup (Out-of-Scope):
1. Peresepan obat-obatan keras/farmakologis (ranah dokter spesialis anak).
2. Transaksi e-commerce / penjualan bahan makanan langsung.

---

## 4. Struktur Tim & Matriks RACI

| Stakeholder / Anggota | Peran Utama | Tanggung Jawab Kunci |
| :--- | :--- | :--- |
| **Muhammad Hisyam Alfaris (Kavleri)** | Tech & Security Lead / Fullstack Engineer | Arsitektur runtime, DevSecOps, hardening VPS, penjaminan PII, merge PR GitHub, rekayasa kode frontend, backend, dan database. |
| **Salsabila Putri Halimi (putrihalimi)** | Data & Impact Lead / Product Manager | Validasi dataset TKPI Kemenkes, alur pemantauan Posyandu, model evaluasi gizi, strategi dampak publik, dan penyusunan laporan. |

### Matriks RACI:
* **Arsitektur Sistem & Keamanan**: Hisyam (A/R), Salsa (C)
* **Validasi Standar Medis & Data Gizi**: Salsa (A/R), Hisyam (C)
* **Pengembangan Kode & Komponen Web**: Hisyam (A/R), Salsa (C)
* **Konfigurasi Server & Domain `nutrishield.web.id`**: Hisyam (A/R), Salsa (I)

*(A = Accountable, R = Responsible, C = Consulted, I = Informed)*
