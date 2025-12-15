-- Auto-generated from schema-map-postgres.yaml
-- engine: postgres
-- table:  password_resets

CREATE UNIQUE INDEX IF NOT EXISTS ux_pr_selector ON password_resets (selector);

CREATE INDEX IF NOT EXISTS idx_pr_user ON password_resets (user_id);

CREATE INDEX IF NOT EXISTS idx_pr_expires ON password_resets (expires_at);

CREATE INDEX IF NOT EXISTS idx_pr_used ON password_resets (used_at);

CREATE INDEX IF NOT EXISTS idx_pr_ip_hash ON password_resets (ip_hash);

