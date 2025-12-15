-- Auto-generated from schema-map-mysql.yaml (map@sha1:B9D3BE28A74392B9B389FDAFB493BD80FA1F6FA4)
-- engine: mysql
-- table:  password_resets

CREATE TABLE IF NOT EXISTS password_resets (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  user_id BIGINT UNSIGNED NOT NULL,
  token_hash CHAR(64) NULL,
  selector CHAR(12) NOT NULL,
  validator_hash BINARY(32) NULL,
  key_version VARCHAR(64) NULL,
  expires_at DATETIME(6) NOT NULL,
  created_at DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  used_at DATETIME(6) NULL,
  ip_hash BINARY(32) NULL,
  ip_hash_key_version VARCHAR(64) NULL,
  user_agent VARCHAR(1024) NULL,
  UNIQUE KEY ux_pr_selector (selector),
  INDEX idx_pr_user (user_id),
  INDEX idx_pr_expires (expires_at),
  INDEX idx_pr_used (used_at),
  INDEX idx_pr_ip_hash (ip_hash)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
