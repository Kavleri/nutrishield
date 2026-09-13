# 🛡️ NutriShield AI Platform (`nutrishield.web.id`)

> **"Build Agent, Deliver Impact."**  
> *Sistem Agen Cerdas Pencegahan Stunting, Pemantauan Gizi 1.000 HPK & Optimalisasi Pangan Lokal Nusantara Berbasis Zero Medical Hallucination Guardrail.*

[![AI HackFest 2026](https://img.shields.io/badge/AI%20HackFest-2026%20Participant-0D9488?style=for-the-badge)](https://github.com/Kavleri/nutrishield)
[![Category](https://img.shields.io/badge/Category-Digital%20Safety%20%26%20Public%20Good-10B981?style=for-the-badge)](docs/01_PROJECT_CHARTER.md)
[![Subcategory](https://img.shields.io/badge/Subcategory-Healthcare%20%26%20Public%20Service-F59E0B?style=for-the-badge)](docs/02_REQUIREMENTS_ENGINEERING.md)
[![Infrastructure](https://img.shields.io/badge/Infrastructure-CloudBaik%20VPS%20%7C%20AI%20Hosting-6366F1?style=for-the-badge)](https://idwebhost.com/ai-hosting)

---

## 📌 Latar Belakang & Urgensi Masalah

Keluarga di Indonesia saat ini menghadapi ancaman ganda yang mendesak:

1. **Krisis Gizi Kronis (Stunting)**: 1 dari 5 balita Indonesia masih mengalami gagal tumbuh akibat minimnya literasi pemenuhan gizi pada 1.000 Hari Pertama Kehidupan (HPK).
2. **Mitos "Makan Sehat Harus Mahal"**: Beredar persepsi keliru di masyarakat bahwa makanan bergizi tinggi harus salmon impor, daging sapi mahal, atau susu formula impor, sementara pangan lokal Nusantara yang kaya gizi terabaikan.
3. **Bahaya Halusinasi AI Medis**: Solusi chatbot AI generatif konvensional sering berhalusinasi saat menghitung dosis, kalori, atau menafsirkan alergi anak—yang berisiko fatal jika diterapkan pada balita rentan.
4. **Beban Administrasi Kader Posyandu**: Pencatatan manual di buku register fisik menghabiskan waktu kader saat hari buka Posyandu, sehingga anak dengan berat badan tidak naik 2 bulan berturut-turut (2T) sering terlambat dirujuk ke Puskesmas.

---

## 💡 Solusi Inovatif: NutriShield

**NutriShield** adalah platform *Autonomous Agentic AI* yang dirancang untuk mendemokratisasi skrining klinis balita dan menyajikan rekomendasi gizi presisi berbasis pangan lokal Nusantara:

* **Zero Medical Hallucination**: AI generatif tidak dibiarkan menghitung angka gizi atau mengevaluasi alergi secara bebas. Komputasi status gizi dikunci 100% menggunakan kode matematika deterministik baku **WHO Anthro 2006** dan **Tabel Komposisi Pangan Indonesia (TKPI) Kemenkes RI**.
* **Optimalisasi Pangan Lokal Nusantara**: Mengangkat kekayaan pangan lokal yang terbukti memiliki densitas nutrisi setara atau lebih tinggi dari pangan impor mahal:
  * **Ikan Kembung**: Mengandung Omega-3 (DHA & EPA) sebesar **2,2g per 100g**—lebih tinggi dari ikan salmon (**1,4g**) dengan harga 1/5-nya di pasar tradisional.
  * **Daun Kelor (*Moringa oleifera*)**: Kaya zat besi, vitamin A, dan kalsium nabati untuk pencegahan anemia pada ibu hamil dan balita.
  * **Tempe & Telur Puyuh**: Sumber protein padat bioaktif yang ramah pencernaan dan ramah kantong.
* **Tindakan Nyata (*Agentic Tool Execution*)**: Bukan sekadar chatbot obrolan, NutriShield menerbitkan **Laporan Medis 12 Halaman Resmi (PDF)** berstandar klinis lengkap dengan stempel digital SHA-256 dan QR Code verifikasi faskes.

---

## 🏛️ Arsitektur Sistem: Neuro-Symbolic Agent

NutriShield memadukan **Symbolic Deterministic Guardrail** (kepastian logika klinis) dengan **Neural Language Interface** (antarmuka empati):

```text
[ Data Balita: Usia, BB, TB, Alergen ]
                 │
                 ▼
+-------------------------------------------------------------+
| TAHAP 1: DETERMINISTIC CORE (Zero Hallucination)            |
| • Formula LMS WHO 2006: Z = ((X/M)^L - 1)/(L*S)             |
| • Klasifikasi Baku Kemenkes: BB/U, TB/U (Stunting), BB/TB   |
| • Binary SQL Guardrail: Eliminasi Mutlak Alergen di DB      |
+-------------------------------------------------------------+
                 │
                 ▼
+-------------------------------------------------------------+
| TAHAP 2: NUSANTARA FOOD INTELLIGENCE & BUDGET OPTIMIZER     |
| • Query Database Laboratorium TKPI Kemenkes RI              |
| • Algoritma Penyusun Menu 7 Hari Hemat (< Rp25.000/hari)    |
+-------------------------------------------------------------+
                 │
                 ▼
+-------------------------------------------------------------+
| TAHAP 3: AGENTIC ACTION & REPORTING ENGINE                  |
| • ReportLab PDF Assembler: Laporan Medis Resmi 12 Halaman   |
| • Stempel Verifikasi Kriptografi SHA-256 & QR Code         |
| • Sinyal Peringatan Dini 2T untuk Kader Posyandu            |
+-------------------------------------------------------------+
```

---

## 🚀 Fitur Utama Platform

| Modul | Deskripsi Fungsional | Dampak Lapangan |
| :--- | :--- | :--- |
| **Kalkulator Antropometri WHO** | Skrining instan Z-score (BB/U, TB/U, BB/TB) balita 0–59 bulan dengan indikator visual *Speedometer Gauge* pita warna KMS. | Menghilangkan salah hitung usia dan kesalahan plot kurva manual oleh kader. |
| **Kurva Pertumbuhan KMS Interaktif** | Render grafik pertumbuhan WHO dinamis (Recharts/SVG) dengan pemetaan titik koordinat tumbuh kembang anak. | Memudahkan orang tua memantau lintasan pertumbuhan anak dari bulan ke bulan. |
| **Smart Food Comparator** | Perbandingan *head-to-head* zat gizi mikro & harga: Ikan Kembung vs Salmon beserta simulator penghematan belanja bulanan. | Mematahkan mitos makanan bergizi harus mahal; menghemat belanja keluarga hingga 70%. |
| **7-Day Affordable Meal Plan** | Rencana menu makan bergizi seimbang 7 hari berbasis belanja pasar tradisional (< Rp25.000/hari) yang 100% bebas alergen anak. | Memberikan kepastian resep masakan rumahan yang aman, lezat, dan bergizi tinggi. |
| **Dashboard Kader Posyandu** | Portal penimbangan massal se-RT/RW (`/posyandu`) dengan sistem *Early Warning Alert 2T* dan ekspor CSV laporan Puskesmas. | Mempercepat administrasi Posyandu dan mencegah keterlambatan rujukan stunting. |
| **Laporan Medis Resmi 12 Halaman** | Penerbitan dokumen klinis formal PDF yang merangkum kurva KMS, tabel nutrisi, dan sertifikat validasi hash SHA-256. | Dokumen legal siap bawa untuk rujukan ke Puskesmas atau dokter anak. |

---

## 🛠️ Stack Teknologi

* **Frontend Application (`frontend/`):**
  * Framework: **React 18**
  * Styling: **Tailwind CSS 3.4** (Custom Nusantara Medical Design System)
  * Visualisasi Data: **Recharts** & **SVG Dynamic Canvas**
  * Ikon & Animasi: **Lucide Icons** & **Framer Motion**
  * Form & Validasi: **React Hook Form** + **Zod**
* **Backend API & Processing Engine (`backend/`):**
  * Framework: **Next.js 14+ (App Router / Route Handlers)**
  * Database Client: **Prisma ORM**
  * Skema Validasi: **Zod Strict DTO**
  * Engine Dokumen: **Python ReportLab (12-Page Clinical PDF Assembler)**
* **Database & Knowledge Persistence (`database/`):**
  * Database: **PostgreSQL (Mode Transaksional ACID & Composite Indexing)**
  * Data Rujukan: **Tabel Komposisi Pangan Indonesia (TKPI) Kemenkes RI** & **Baku WHO Anthro 2006 (LMS Parameters)**
* **Infrastruktur Cloud:**
  * Didukung oleh **[Cloud VPS](https://cloudbaik.com)** (4 Core CPU, 4GB RAM, 20GB SSD) & **[AI Hosting IDwebhost](https://idwebhost.com/ai-hosting)**
  * Web Server: **Nginx Reverse Proxy** dengan **SSL Let's Encrypt (HTTPS)**
  * Domain Resmi: **`nutrishield.web.id`**

---

## 👥 Tim Pengembang (Shadow AI)

* **Muhammad Hisyam Alfaris ([@Kavleri](https://github.com/Kavleri))** — *Tech & Security Lead*  
  Bertanggung jawab atas arsitektur fullstack, DevSecOps, proteksi data pribadi balita (PII Redaction), isolasi infrastruktur cloud, dan integrasi backend.
* **Salsabila Putri Halimi ([@putrihalimi](https://github.com/putrihalimi))** — *Data & Public Impact Lead*  
  Bertanggung jawab atas validasi dataset klinis TKPI Kemenkes RI, baku antropometri WHO, pemodelan alur Posyandu, dan strategi dampak sosial publik.

---

## 📋 Dokumentasi Lengkap Proyek

Seluruh rancangan rekayasa perangkat lunak dan manajemen proyek telah disusun secara rinci:
* 📄 [**Fase 0: Brainstorming, Ideation 5-Whys & Empathy Mapping**](docs/00_BRAINSTORMING_AND_IDEATION.md)
* 📄 [**Fase 1: Studi Kelayakan TELOS & Kepatuhan Etika UU PDP**](docs/00_FEASIBILITY_AND_ETHICS.md)
* 📄 [**Fase 2: Pemetaan Alur Pengguna (User Journey Map: As-Is vs To-Be)**](docs/00_USER_JOURNEY_MAPPING.md)
* 📄 [**Project Charter & Matriks RACI**](docs/01_PROJECT_CHARTER.md)
* 📄 [**Software Requirements Specification (SRS) IEEE 830**](docs/02_REQUIREMENTS_ENGINEERING.md)
* 📄 [**System Architecture Document (SAD)**](docs/03_SYSTEM_ARCHITECTURE.md)
* 📄 [**Jadwal Kerja 14 Hari & Granular WBS**](docs/04_WBS_AND_AGILE_ROADMAP.md)
* 📄 [**Desain Skema Database PostgreSQL**](docs/05_DATABASE_DESIGN.md)

---

## 💻 Panduan Menjalankan Aplikasi Secara Lokal

### Prasyarat:
* Node.js v18+ atau v20+
* Python 3.10+ (untuk engine ReportLab PDF)
* PostgreSQL 15+

### Langkah Instalasi:
```bash
# 1. Clone repositori
git clone https://github.com/Kavleri/nutrishield.git
cd nutrishield

# 2. Masuk ke folder web
cd web-nutrishield

# 3. Install seluruh dependensi frontend dan backend
npm install

# 4. Setup environment variable
cp .env.example .env

# 5. Jalankan migrasi dan seeding database
npm run prisma:migrate
npm run prisma:generate

# 6. Jalankan aplikasi secara lokal
npm run dev
```

Aplikasi frontend akan aktif di `http://localhost:3000` dan backend API di `http://localhost:3001`.

---

## 📜 Lisensi & Kepatuhan

Dikembangkan untuk **AI HackFest 2026** di bawah lisensi MIT. Mematuhi **UU No. 27 Tahun 2022 tentang Perlindungan Data Pribadi (UU PDP)** dan standar pemantauan tumbuh kembang anak **Kementerian Kesehatan Republik Indonesia**.
