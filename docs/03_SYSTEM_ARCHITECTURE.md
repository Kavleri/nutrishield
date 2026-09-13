# System Architecture Document (SAD): NutriShield

**Pola Arsitektur:** Clean Architecture + Domain-Driven Design (DDD) + Neuro-Symbolic Agent Pattern  
**Stack Teknologi Utama:**
* **Frontend:** React + Tailwind CSS + Lucide Icons + Framer Motion + Recharts (Dynamic KMS Curves)
* **Backend:** Next.js (App Router / Route Handlers / Server Actions) + Zod + Prisma ORM + ReportLab Bridge
* **Database:** PostgreSQL (Relational schema, indexed queries, connection pooling, ACID transactions)
* **Deployment:** Cloud VPS Linux (4 vCPU, 4GB RAM, 20GB SSD), Nginx Reverse Proxy, Let's Encrypt SSL (`nutrishield.web.id`)

---

## 1. Diagram Arsitektur Tingkat Tinggi (Layered Clean Architecture)

```text
+-------------------------------------------------------------------------------+
|  1. PRESENTATION LAYER (Frontend: React + Tailwind CSS)                       |
|     - Single Page Application / Client Components (React 18/19)               |
|     - Styling: Tailwind CSS 3.4+ (Custom Medical Nusantara Palette)           |
|     - Visuals: Recharts & SVG Dynamic KMS Curve, Speedometer Gauge            |
|     - State & Forms: React Hook Form + Zod Client Validation                  |
+-------------------------------------------------------------------------------+
                                      | HTTP REST / JSON API
                                      v
+-------------------------------------------------------------------------------+
|  2. API & APPLICATION LAYER (Backend: Next.js App Router)                     |
|     - Next.js Route Handlers: /api/anthro, /api/foods, /api/report, /api/auth  |
|     - Validation: Zod Schemas (Strict Request DTO Validation)                 |
|     - Security: PII Redaction Middleware, Rate Limiting, CORS Protection      |
|     - Bridge: Python ReportLab Subprocess / Socket Bridge for 12-Page PDF     |
+-------------------------------------------------------------------------------+
                                      | Prisma ORM / SQL
                                      v
+-------------------------------------------------------------------------------+
|  3. DOMAIN & DATA PERSISTENCE LAYER (Database: PostgreSQL)                    |
|     - PostgreSQL 15/16 Engine (ACID, High-Performance Indexing)              |
|     - Tables: who_anthro_lms, tkpi_foods, child_measurements, allergens      |
|     - Zero Hallucination Guardrail: Hard SQL Exclusion on Allergens           |
|     - Connection Pool: Prisma Client with connection pooling                  |
+-------------------------------------------------------------------------------+
```

---

## 2. Bounded Contexts (Domain-Driven Design)

1. **Anthropometry & Clinical Context (`anthro-core`)**:
   * Menghitung Z-score baku WHO 2006 (BB/U, TB/U, BB/TB) secara deterministik menggunakan parameter LMS.
   * Tidak memiliki toleransi halusinasi (Zero Medical Hallucination).
2. **Nusantara Food Intelligence Context (`food-intelligence`)**:
   * Katalog 50+ bahan pangan lokal Nusantara berbasis data laboratorium TKPI Kemenkes RI.
   * Perhitungan densitas gizi mikro (DHA/EPA, Zat Besi, Kalsium, Zinc, Vitamin A & C) terhadap harga pasar.
3. **Medical Safety & Allergy Guardrail Context (`guardrail-safety`)**:
   * Filter biner di level PostgreSQL: `WHERE allergen NOT IN (...)` sebelum menyentuh modul rekomendasi.
4. **Clinical Reporting & Certification Context (`reporting-engine`)**:
   * Menghasilkan berkas PDF 12 halaman resmi dengan ReportLab terverifikasi hash SHA-256 dan QR Code.
