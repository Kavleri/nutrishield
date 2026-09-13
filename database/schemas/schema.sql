-- ==============================================================================
-- NutriShield Database Schema (SQLite 3 - WAL Mode)
-- Standard Reference: WHO Anthro 2006 & Kemenkes RI TKPI 2020
-- ==============================================================================

PRAGMA journal_mode = WAL;
PRAGMA foreign_keys = ON;

-- 1. WHO Anthro 2006 Reference Standards (LMS Parameters)
CREATE TABLE IF NOT EXISTS who_anthro_lms (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    indicator TEXT NOT NULL,          -- 'waz' (BB/U), 'haz' (TB/U), 'whz' (BB/TB)
    gender TEXT NOT NULL,             -- 'male', 'female'
    age_months REAL NOT NULL,         -- 0.0 to 59.0
    length_cm REAL,                   -- For WHZ (45.0 to 120.0 cm)
    l_param REAL NOT NULL,            -- Box-Cox power L
    m_param REAL NOT NULL,            -- Median M
    s_param REAL NOT NULL,            -- Coefficient of variation S
    UNIQUE(indicator, gender, age_months, length_cm)
);

-- 2. Indonesian Food Composition Table (TKPI Kemenkes RI)
CREATE TABLE IF NOT EXISTS tkpi_foods (
    food_id TEXT PRIMARY KEY,
    name_id TEXT NOT NULL,
    common_name TEXT,
    category TEXT NOT NULL,           -- 'Lauk Hewani', 'Lauk Nabati', 'Sayuran', 'Buah', 'Pokok'
    energy_kcal REAL NOT NULL,
    protein_g REAL NOT NULL,
    fat_g REAL NOT NULL,
    carbs_g REAL NOT NULL,
    calcium_mg REAL DEFAULT 0,
    iron_mg REAL DEFAULT 0,
    zinc_mg REAL DEFAULT 0,
    vit_a_mcg REAL DEFAULT 0,
    vit_c_mg REAL DEFAULT 0,
    omega3_g REAL DEFAULT 0,
    avg_cost_per_100g REAL DEFAULT 0, -- Estimasi harga pasar tradisional (IDR)
    allergen_tags TEXT,               -- 'telur,seafood,susu,kacang,gluten'
    source_ref TEXT DEFAULT 'TKPI Kemenkes 2020'
);

-- 3. Child Anthropometric Measurements (PII Redacted)
CREATE TABLE IF NOT EXISTS child_measurements (
    measurement_id TEXT PRIMARY KEY,
    child_alias TEXT NOT NULL,        -- Nama samaran / ID anonim
    gender TEXT NOT NULL,             -- 'male', 'female'
    birth_date TEXT NOT NULL,
    measure_date TEXT NOT NULL,
    age_months INTEGER NOT NULL,
    weight_kg REAL NOT NULL,
    height_cm REAL NOT NULL,
    head_circ_cm REAL,
    waz_zscore REAL,                  -- BB/U Z-score
    haz_zscore REAL,                  -- TB/U Z-score
    whz_zscore REAL,                  -- BB/TB Z-score
    nutritional_status TEXT,          -- 'Gizi Baik', 'Gizi Kurang', 'Stunted', 'Normal'
    posyandu_rt_rw TEXT,
    is_2t_alert BOOLEAN DEFAULT 0,    -- Alert 2T (tidak naik 2 bulan)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Indexes for lightning fast queries (<1ms)
CREATE INDEX IF NOT EXISTS idx_who_lms ON who_anthro_lms(indicator, gender, age_months);
CREATE INDEX IF NOT EXISTS idx_tkpi_cat ON tkpi_foods(category);
CREATE INDEX IF NOT EXISTS idx_child_measure ON child_measurements(child_alias, measure_date);
