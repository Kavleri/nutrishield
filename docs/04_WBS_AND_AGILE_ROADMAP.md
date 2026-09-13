# Rencana Eksekusi Harian 14 Hari (Daily Action Plan & Granular WBS)

**Periode Proyek:** 13 September 2026 – 27 September 2026 (14 Hari Kalender)  
**Target Rilis:** Produksi Penuh di `nutrishield.web.id` + Siap Demo Juri Hackathon  
**Stack Teknologi:**
* **Frontend:** React + Tailwind CSS + Lucide Icons + Recharts
* **Backend:** Next.js (App Router / API Routes) + Prisma ORM + ReportLab Bridge
* **Database:** PostgreSQL (Mode ACID, Indexing, Data TKPI & WHO)

---

## 📅 Rincian Kerja Harian (Day 1 s/d Day 14)

```mermaid
gantt
    title Jadwal Kerja 14 Hari NutriShield Platform
    dateFormat  YYYY-MM-DD
    section Minggu 1: Engine & Core UI
    Day 1: Setup Monorepo & Postgres     :done, d1, 2026-09-13, 1d
    Day 2: PostgreSQL Schema & TKPI Seed :active, d2, 2026-09-14, 1d
    Day 3: WHO Anthro LMS Core Engine    :d3, 2026-09-15, 1d
    Day 4: Guardrail Alergi & Budget Opt :d4, 2026-09-16, 1d
    Day 5: Next.js API Layer Endpoints   :d5, 2026-09-17, 1d
    Day 6: Tailwind Design System Atoms  :d6, 2026-09-18, 1d
    Day 7: Form Antropometri & Speedometer:d7, 2026-09-19, 1d
    section Minggu 2: Visuals, PDF & Deploy
    Day 8: Kurva Pertumbuhan KMS (SVG/Chart):d8, 2026-09-20, 1d
    Day 9: Smart Food Comparator & Meal Plan:d9, 2026-09-21, 1d
    Day 10: Portal Kader Posyandu (/posyandu):d10, 2026-09-22, 1d
    Day 11: Integrasi PDF 12 Halaman Resmi  :d11, 2026-09-23, 1d
    Day 12: Showcase Arsitektur Juri (/arch) :d12, 2026-09-24, 1d
    Day 13: Cloud VPS Deploy & SSL nutrishield:d13, 2026-09-25, 1d
    Day 14: Audit DevSecOps, UAT & Demo Juri :d14, 2026-09-26, 1d
```

---

### 🔹 HARI 1 (Day 1): Fondasi Modular, Repo Git & Inisialisasi Stack
* [x] **TASK-001**: Inisialisasi Git dan branch `main` pada `Kavleri/nutrishield`.
* [x] **TASK-002**: Penyusunan `.gitignore` komprehensif (Next.js, Tailwind, Postgres, env).
* [x] **TASK-003**: Pembuatan dokumen formal: Project Charter, SRS, SAD, WBS 14 Hari, DB Design.
* [ ] **TASK-004**: Inisialisasi Next.js 14+ App Router pada folder `backend/`.
* [ ] **TASK-005**: Inisialisasi React + Tailwind CSS 3.4+ pada folder `frontend/`.
* [ ] **TASK-006**: Konfigurasi koneksi PostgreSQL lokal dan Prisma ORM (`schema.prisma`).
* [ ] **TASK-007**: Setup script root `package.json` untuk menjalankan frontend & backend secara bersamaan (*concurrently*).

---

### 🔹 HARI 2 (Day 2): Data Engineering, PostgreSQL Migrations & Seeding
* [ ] **TASK-008**: Pembuatan migrasi PostgreSQL untuk tabel `who_anthro_lms` (LMS Z-score).
* [ ] **TASK-009**: Pembuatan migrasi PostgreSQL untuk tabel `tkpi_foods` (Komposisi Pangan Kemenkes).
* [ ] **TASK-010**: Pembuatan migrasi PostgreSQL untuk tabel `child_measurements` (Riwayat Antropometri Balita).
* [ ] **TASK-011**: Pembuatan migrasi PostgreSQL untuk tabel `posyandu_cohorts` & log kader.
* [ ] **TASK-012**: Pembuatan script seeder otomatis `seed_who_lms.ts` untuk mengimpor parameter WHO 2006 (0–59 bulan, laki-laki & perempuan).
* [ ] **TASK-013**: Pembuatan script seeder `seed_tkpi_foods.ts` untuk 50+ pangan lokal unggulan (Ikan Kembung, Daun Kelor, Tempe, Hati Ayam, Telur Puyuh, dll).
* [ ] **TASK-014**: Penambahan composite index pada PostgreSQL untuk pencarian cepat kategori pangan dan umur balita.
* [ ] **TASK-015**: Verifikasi integritas data: uji query PostgreSQL via Prisma Studio (`npx prisma studio`).

---

### 🔹 HARI 3 (Day 3): Core Engine Deterministik WHO LMS (Zero Hallucination)
* [ ] **TASK-016**: Implementasi fungsi matematika Box-Cox Power Transform Z-Score di backend Next.js (`whoAnthroService.ts`).
* [ ] **TASK-017**: Penanganan kasus khusus WHO: koreksi batas ekstrem Z > +3 SD dan Z < -3 SD.
* [ ] **TASK-018**: Implementasi indikator BB/U (Berat Badan menurut Umur) & klasifikasi Permenkes 2/2020.
* [ ] **TASK-019**: Implementasi indikator TB/U (Tinggi Badan menurut Umur / Penentu Stunting).
* [ ] **TASK-020**: Implementasi indikator BB/TB (Berat Badan menurut Tinggi Badan / Wasting).
* [ ] **TASK-021**: Pembuatan unit test suite dengan Jest/Vitest untuk memvalidasi 20+ skenario balita nyata terhadap tabel Kemenkes (Toleransi 0.00).
* [ ] **TASK-022**: Pembuatan fungsi deteksi otomatis anomali pengukuran (misal: BB atau TB di luar rentang biologis wajar).

---

### 🔹 HARI 4 (Day 4): Guardrail Alergi & Algoritma Optimasi Budget Menu
* [ ] **TASK-023**: Implementasi *Binary Allergy Filter* di level query PostgreSQL (Hard filter `WHERE NOT (allergen_tags && ARRAY[...])`).
* [ ] **TASK-024**: Pembuatan blacklist terindeks untuk 8 alergen utama: telur, seafood/ikan laut, susu sapi, kacang tanah, kedelai, gandum/gluten, kerang, ikan air tawar.
* [ ] **TASK-025**: Implementasi algoritma substitusi nutrisi (misal: jika anak alergi susu sapi, sistem otomatis merekomendasikan daun kelor + ikan kembung untuk asupan kalsium & protein).
* [ ] **TASK-026**: Implementasi *Budget Optimizer Algorithm* untuk menyusun menu harian bergizi tinggi di bawah Rp25.000/hari.
* [ ] **TASK-027**: Unit test guardrail alergi: memastikan 0% kebocoran bahan terlarang pada 100 kombinasi alergi.

---

### 🔹 HARI 5 (Day 5): Next.js Backend API Endpoints (RESTful + Zod)
* [ ] **TASK-028**: Konfigurasi Next.js Route Handler `/api/anthro/calculate` dengan validasi schema Zod.
* [ ] **TASK-029**: Konfigurasi endpoint `/api/foods/search` (pencarian pangan lokal dengan filter alergen dan kategori).
* [ ] **TASK-030**: Konfigurasi endpoint `/api/foods/compare` (perbandingan data nutrisi 2 pangan, misal Ikan Kembung vs Salmon).
* [ ] **TASK-031**: Konfigurasi endpoint `/api/mealplan/generate` (output menu 7 hari terpersonalisasi).
* [ ] **TASK-032**: Konfigurasi endpoint `/api/posyandu/measurements` (CRUD pengukuran balita Posyandu).
* [ ] **TASK-033**: Implementasi middleware redaksi data pribadi (PII) untuk menyamarkan nama dan NIK sebelum disimpan.
* [ ] **TASK-034**: Setup CORS, Rate Limiting, dan error handler global di Next.js.

---

### 🔹 HARI 6 (Day 6): Frontend Design System & UI Atoms (React + Tailwind CSS)
* [ ] **TASK-035**: Konfigurasi `tailwind.config.js` dengan palet warna custom: Emerald Nusantara (`#0D9488`), Warm Honey (`#F59E0B`), dan status KMS (Merah, Kuning, Hijau).
* [ ] **TASK-036**: Setup Google Font *Plus Jakarta Sans* pada layout utama.
* [ ] **TASK-037**: Pembuatan komponen atom UI: `Button` (Primary, Secondary, Outline, Danger).
* [ ] **TASK-038**: Pembuatan komponen atom UI: `Input`, `Select`, `RadioGroup`, dan `CheckboxChip` (untuk pemilih alergen).
* [ ] **TASK-039**: Pembuatan komponen molekul UI: `Badge`, `Card`, `Modal`, `AlertBox`, dan `Tooltip`.
* [ ] **TASK-040**: Pembuatan komponen `Navbar` responsif dengan navigasi: Beranda, Kalkulator, Banding Pangan, Posyandu, Arsitektur.
* [ ] **TASK-041**: Pembuatan komponen `Footer` dengan identitas resmi tim Shadow AI, sumber data Kemenkes, dan kontak.

---

### 🔹 HARI 7 (Day 7): Form Antropometri & Speedometer Gauge Interaktif
* [ ] **TASK-042**: Pembuatan halaman kalkulator antropometri balita (`/calculator`).
* [ ] **TASK-043**: Form input balita: Nama Alias, Jenis Kelamin (Laki-laki/Perempuan toggle), Tanggal Lahir / Usia (Bulan), Berat Badan (kg), Tinggi Badan (cm).
* [ ] **TASK-044**: Komponen pemilih riwayat alergi anak dengan chip multi-select interaktif.
* [ ] **TASK-045**: Pembuatan komponen visual **Speedometer Gauge** berbasis SVG/Tailwind yang bergerak mulus menunjukkan posisi Z-score anak (Gizi Buruk, Gizi Kurang, Gizi Baik, Berisiko Lebih).
* [ ] **TASK-046**: Kartu Ringkasan Klinis: Status BB/U, TB/U (Deteksi Stunting), BB/TB (Wasting), beserta rekomendasi tindak lanjut medis.
* [ ] **TASK-047**: State management form menggunakan React Hook Form + integrasi API backend via TanStack Query.

---

### 🔹 HARI 8 (Day 8): Visualisasi Kurva Pertumbuhan WHO KMS (Recharts / SVG)
* [ ] **TASK-048**: Penarikan dataset kurva persentil WHO (garis -3SD, -2SD, 0SD, +2SD, +3SD) untuk rentang 0–59 bulan.
* [ ] **TASK-049**: Implementasi grafik kurva **Berat Badan menurut Umur (BB/U)** menggunakan Recharts dengan area warna standar KMS Kemenkes.
* [ ] **TASK-050**: Implementasi grafik kurva **Tinggi Badan menurut Umur (TB/U)** (Kurva Deteksi Stunting).
* [ ] **TASK-051**: Penambahan titik koordinat dinamis (*user pin point*) yang memplot posisi anak pengguna di atas kurva.
* [ ] **TASK-052**: Fitur toggle switch antara grafik balita laki-laki dan perempuan.
* [ ] **TASK-053**: Optimasi tampilan mobile agar grafik dapat di-zoom atau digeser secara mulus di layar smartphone kader.

---

### 🔹 HARI 9 (Day 9): Smart Food Comparator & 7-Day Meal Plan Generator
* [ ] **TASK-054**: Pembuatan halaman komparator pangan Nusantara (`/comparator`).
* [ ] **TASK-055**: Kartu perbandingan berdampingan *Head-to-Head*: **Ikan Kembung Lokal vs Ikan Salmon Impor**.
* [ ] **TASK-056**: Visualisasi bar chart perbandingan zat gizi mikro: Omega-3 (2,2g vs 1,4g), Protein (21,3g vs 19,9g), Zat Besi, dan Kalsium.
* [ ] **TASK-057**: Simulator penghematan biaya: kalkulator perbandingan biaya belanja per bulan keluarga Indonesia.
* [ ] **TASK-058**: Pembuatan tampilan **Rencana Menu 7 Hari (Senin – Minggu)** dengan rincian Sarapan, Makan Siang, Makan Malam, dan Selingan Bergizi.
* [ ] **TASK-059**: Fitur filter menu instan: bebas telur, bebas seafood, ramah balita 6–11 bulan (MPASI lumat) vs 12–23 bulan.
* [ ] **TASK-060**: Estimasi total belanja harian di pasar tradisional (< Rp25.000/hari) tercantum di setiap menu.

---

### 🔹 HARI 10 (Day 10): Dashboard Kader Posyandu Digital (`/posyandu`)
* [ ] **TASK-061**: Pembuatan halaman portal kader Posyandu (`/posyandu`).
* [ ] **TASK-062**: Form input kilat untuk penimbangan massal hari buka Posyandu.
* [ ] **TASK-063**: Tabel rekap balita se-RT/RW dengan pagination, search, dan filter status gizi.
* [ ] **TASK-064**: Fitur **Early Warning Alert 2T**: Sistem otomatis menandai warna merah balita yang berat badannya tidak naik 2 bulan berturut-turut.
* [ ] **TASK-065**: Statistik agregat Posyandu: Total balita dipantau, % gizi baik, % risiko stunting, % perlu rujukan Puskesmas.
* [ ] **TASK-066**: Fitur ekspor rekapitulasi data bulanan ke format CSV / Excel untuk laporan ke Bidan Desa.

---

### 🔹 HARI 11 (Day 11): Integrasi Generator Laporan PDF Medis 12 Halaman
* [ ] **TASK-067**: Pembuatan API Route `/api/report/generate-pdf` di Next.js yang memanggil engine ReportLab Python.
* [ ] **TASK-068**: Passing data dinamis dari form balita pengguna ke generator PDF (nama inisial, Z-score, grafik kurva yang di-render ke image buffer, rekomendasi menu).
* [ ] **TASK-069**: Validasi layout PDF 12 halaman: Cover elegan, Kartu KPI, Bab I–V, 4 grafik komparasi resolusi tinggi, tabel TKPI, 7-day meal plan, dan habit tracker.
* [ ] **TASK-070**: Integrasi stempel digital SHA-256 Hash dan QR Code verifikasi dokumen di pojok kanan bawah PDF.
* [ ] **TASK-071**: Tombol *One-Click Download* dengan indikator progress bar di website.
* [ ] **TASK-072**: Pengujian unduhan PDF di browser Chrome, Firefox, Safari iOS, dan Android Chrome.

---

### 🔹 HARI 12 (Day 12): Showcase Arsitektur Juri Hackathon (`/architecture`)
* [ ] **TASK-073**: Pembuatan halaman transparansi sistem untuk juri (`/architecture`).
* [ ] **TASK-074**: Diagram interaktif: Alur Neuro-Simbolik (Bagaimana data mentah masuk, difilter deterministik, dan dinarasikan oleh AI).
* [ ] **TASK-075**: Interactive Guardrail Playground: Juri bisa menguji input makanan ekstrem (misal memasukkan alergen sengaja) dan melihat bukti penolakan sistem.
* [ ] **TASK-076**: Profil tim Shadow AI: Pembagian peran teknis Mas Hisyam (Security/DevSecOps) dan Mbak Salsa (Data Science/Policy).
* [ ] **TASK-077**: Widget pemantau performa live: Latensi respon API (< 50ms) dan penggunaan memori server.

---

### 🔹 HARI 13 (Day 13): Deployment Cloud VPS, PostgreSQL & Domain `nutrishield.web.id`
* [ ] **TASK-078**: Instalasi dan konfigurasi PostgreSQL di Cloud VPS.
* [ ] **TASK-079**: Menjalankan migrasi database dan seeding data TKPI di server VPS.
* [ ] **TASK-080**: Build produksi Next.js backend dan React frontend di VPS.
* [ ] **TASK-081**: Konfigurasi Systemd service `nutrishield-backend.service` dengan batas memori `MemoryMax=500M`.
* [ ] **TASK-082**: Konfigurasi Nginx Reverse Proxy untuk domain `nutrishield.web.id` dan `www.nutrishield.web.id`.
* [ ] **TASK-083**: Pemasangan sertifikat SSL Let''s Encrypt (HTTPS otomatis dengan certbot).
* [ ] **TASK-084**: Uji coba akses publik domain `https://nutrishield.web.id`.

---

### 🔹 HARI 14 (Day 14): Audit DevSecOps, UAT & Persiapan Demo Juri
* [ ] **TASK-085**: Audit performa web menggunakan Google Lighthouse (Target skor: Performance > 90, Accessibility 100, Best Practices 100, SEO 100).
* [ ] **TASK-086**: Audit keamanan OWASP Top 10 (proteksi XSS, SQL Injection via ORM, CSRF, Secure HTTP Headers di Nginx).
* [ ] **TASK-087**: Verifikasi akhir redaksi PII: memastikan tidak ada data sensitif balita yang tersimpan tanpa enkripsi atau bocor di log.
* [ ] **TASK-088**: User Acceptance Testing (UAT) bersama Mbak Salsa untuk pengujian seluruh skenario alur Posyandu.
* [ ] **TASK-089**: Penyusunan slide presentasi dan video demo 3 menit untuk submission kompetisi.
* [ ] **TASK-090**: Final freeze code & rilis tag versi `v1.0.0-release` di GitHub.
