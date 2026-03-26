-- ── Agentic AI Value Platform — PostgreSQL Schema ─────────────────────────
-- Run manually if needed: psql $DATABASE_URL -f schema.sql
-- On Railway, tables are created automatically at server startup via initDB()
-- ────────────────────────────────────────────────────────────────────────────

CREATE TABLE IF NOT EXISTS clients (
  id          TEXT PRIMARY KEY,
  name        TEXT NOT NULL,
  industry    TEXT DEFAULT '',
  size        TEXT DEFAULT '',
  created_at  TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS assessments (
  id                 TEXT PRIMARY KEY,
  client_id          TEXT NOT NULL REFERENCES clients(id),
  stakeholder_name   TEXT NOT NULL,
  stakeholder_role   TEXT DEFAULT '',
  stakeholder_email  TEXT DEFAULT '',
  domain             TEXT NOT NULL,
  answers            JSONB NOT NULL DEFAULT '[]',
  scores             JSONB NOT NULL DEFAULT '{}',
  overall_score      DOUBLE PRECISION NOT NULL DEFAULT 0,
  maturity_level     TEXT NOT NULL DEFAULT 'L1',
  created_at         TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS projects (
  id              TEXT PRIMARY KEY,
  client_id       TEXT NOT NULL REFERENCES clients(id),
  project_name    TEXT NOT NULL,
  domain          TEXT NOT NULL,
  asset_name      TEXT DEFAULT '',
  status          TEXT NOT NULL DEFAULT 'planned',
  progress        INTEGER DEFAULT 0,
  sponsor         TEXT DEFAULT '',
  sponsor_email   TEXT DEFAULT '',
  start_date      TEXT DEFAULT '',
  target_date     TEXT DEFAULT '',
  investment      DOUBLE PRECISION DEFAULT 0,
  projected_roi   DOUBLE PRECISION DEFAULT 0,
  actual_savings  DOUBLE PRECISION DEFAULT 0,
  kpi_target      TEXT DEFAULT '',
  kpi_actual      TEXT DEFAULT '',
  notes           TEXT DEFAULT '',
  created_at      TIMESTAMPTZ DEFAULT NOW(),
  updated_at      TIMESTAMPTZ DEFAULT NOW()
);
