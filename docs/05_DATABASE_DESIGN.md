# Database Design & Data Architecture: PostgreSQL

**Tipe Database:** PostgreSQL 15 / 16  
**ORM:** Prisma ORM / Native PostgreSQL Driver  
**Tujuan:** Penyimpanan deterministik standar WHO Anthro 2006, database pangan TKPI Kemenkes RI, profil balita, riwayat pengukuran, dan data Posyandu.

---

## 1. DDL PostgreSQL Schema

```sql
-- Extension untuk UUID (jika diperlukan)
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- 1. Tabel Baku Antropometri WHO Anthro 2006 (LMS Parameters)
CREATE TABLE IF NOT EXISTS who_anthro_lms (
    id SERIAL PRIMARY KEY,
    indicator VARCHAR(10) NOT NULL,       -- 'waz' (BB/U), 'haz' (TB/U), 'whz' (BB/TB)
    gender VARCHAR(10) NOT NULL,          -- 'male', 'female'
    age_months NUMERIC(5, 2) NOT NULL,    -- 0.00 to 59.00
    length_cm NUMERIC(5, 2),              -- Untuk WHZ (45.00 to 120.00 cm)
    l_param NUMERIC(10, 6) NOT NULL,      -- Box-Cox power L
    m_param NUMERIC(10, 6) NOT NULL,      -- Median M
    s_param NUMERIC(10, 6) NOT NULL,      -- Coefficient of variation S
    CONSTRAINT uq_who_indicator_age UNIQUE(indicator, gender, age_months, length_cm)
);

-- 2. Tabel Komposisi Pangan Indonesia (TKPI Kemenkes RI)
CREATE TABLE IF NOT EXISTS tkpi_foods (
    food_id VARCHAR(50) PRIMARY KEY,
    name_id VARCHAR(150) NOT NULL,
    common_name VARCHAR(150),
    category VARCHAR(50) NOT NULL,        -- 'Lauk Hewani', 'Lauk Nabati', 'Sayuran', 'Buah', 'Pokok'
    energy_kcal NUMERIC(8, 2) NOT NULL,
    protein_g NUMERIC(8, 2) NOT NULL,
    fat_g NUMERIC(8, 2) NOT NULL,
    carbs_g NUMERIC(8, 2) NOT NULL,
    calcium_mg NUMERIC(8, 2) DEFAULT 0,
    iron_mg NUMERIC(8, 2) DEFAULT 0,
    zinc_mg NUMERIC(8, 2) DEFAULT 0,
    vit_a_mcg NUMERIC(8, 2) DEFAULT 0,
    vit_c_mg NUMERIC(8, 2) DEFAULT 0,
    omega3_g NUMERIC(8, 2) DEFAULT 0,
    avg_cost_per_100g NUMERIC(10, 2) DEFAULT 0, -- Estimasi harga pasar tradisional (IDR)
    allergen_tags TEXT[],                 -- Array alergen: ARRAY['telur','seafood','susu','kacang','gluten']
    source_ref VARCHAR(100) DEFAULT 'TKPI Kemenkes 2020',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- 3. Tabel Profil & Pengukuran Antropometri Balita (PII Redacted)
CREATE TABLE IF NOT EXISTS child_measurements (
    measurement_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    child_alias VARCHAR(100) NOT NULL,    -- Nama samaran / ID anonim (Proteksi PII)
    gender VARCHAR(10) NOT NULL,          -- 'male', 'female'
    birth_date DATE NOT NULL,
    measure_date DATE NOT NULL,
    age_months INTEGER NOT NULL,
    weight_kg NUMERIC(5, 2) NOT NULL,
    height_cm NUMERIC(5, 2) NOT NULL,
    head_circ_cm NUMERIC(5, 2),
    waz_zscore NUMERIC(5, 2),             -- BB/U Z-score
    haz_zscore NUMERIC(5, 2),             -- TB/U Z-score
    whz_zscore NUMERIC(5, 2),             -- BB/TB Z-score
    nutritional_status VARCHAR(50),       -- 'Gizi Baik', 'Gizi Kurang', 'Stunted', 'Normal'
    posyandu_rt_rw VARCHAR(100),
    is_2t_alert BOOLEAN DEFAULT FALSE,    -- TRUE jika berat badan 2 bulan berturut-turut tidak naik
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Indeks Kinerja Tinggi
CREATE INDEX IF NOT EXISTS idx_who_lms_search ON who_anthro_lms(indicator, gender, age_months);
CREATE INDEX IF NOT EXISTS idx_tkpi_category ON tkpi_foods(category);
CREATE INDEX IF NOT EXISTS idx_child_measure_date ON child_measurements(child_alias, measure_date);
```

---

## 2. Prisma Schema (`schema.prisma`)

```prisma
datasource db {
  provider = "postgresql"
  url      = env("DATABASE_URL")
}

generator client {
  provider = "prisma-client-js"
}

model WhoAnthroLms {
  id         Int      @id @default(autoincrement())
  indicator  String   @db.VarChar(10)
  gender     String   @db.VarChar(10)
  ageMonths  Decimal  @map("age_months") @db.Decimal(5, 2)
  lengthCm   Decimal? @map("length_cm") @db.Decimal(5, 2)
  lParam     Decimal  @map("l_param") @db.Decimal(10, 6)
  mParam     Decimal  @map("m_param") @db.Decimal(10, 6)
  sParam     Decimal  @map("s_param") @db.Decimal(10, 6)

  @@unique([indicator, gender, ageMonths, lengthCm], name: "uq_who_indicator_age")
  @@index([indicator, gender, ageMonths])
  @@map("who_anthro_lms")
}

model TkpiFood {
  foodId        String   @id @map("food_id") @db.VarChar(50)
  nameId        String   @map("name_id") @db.VarChar(150)
  commonName    String?  @map("common_name") @db.VarChar(150)
  category      String   @db.VarChar(50)
  energyKcal    Decimal  @map("energy_kcal") @db.Decimal(8, 2)
  proteinG      Decimal  @map("protein_g") @db.Decimal(8, 2)
  fatG          Decimal  @map("fat_g") @db.Decimal(8, 2)
  carbsG        Decimal  @map("carbs_g") @db.Decimal(8, 2)
  calciumMg     Decimal  @default(0) @map("calcium_mg") @db.Decimal(8, 2)
  ironMg        Decimal  @default(0) @map("iron_mg") @db.Decimal(8, 2)
  zincMg        Decimal  @default(0) @map("zinc_mg") @db.Decimal(8, 2)
  vitAMcg       Decimal  @default(0) @map("vit_a_mcg") @db.Decimal(8, 2)
  vitCMg        Decimal  @default(0) @map("vit_c_mg") @db.Decimal(8, 2)
  omega3G       Decimal  @default(0) @map("omega3_g") @db.Decimal(8, 2)
  avgCost100g   Decimal  @default(0) @map("avg_cost_per_100g") @db.Decimal(10, 2)
  allergenTags  String[] @map("allergen_tags")
  sourceRef     String   @default("TKPI Kemenkes 2020") @map("source_ref")
  createdAt     DateTime @default(now()) @map("created_at")

  @@index([category])
  @@map("tkpi_foods")
}
```
