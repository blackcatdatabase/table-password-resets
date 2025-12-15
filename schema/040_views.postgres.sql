-- Auto-generated from schema-views-postgres.yaml (map@sha1:A35B3CB52780A1043442511D947A51BA2C27622C)
-- engine: postgres
-- table:  password_resets

-- Contract view for [password_resets]
-- Exposes validator_hash for confirmation; token_hash remains hidden.
CREATE OR REPLACE VIEW vw_password_resets AS
SELECT
  id,
  user_id,
  selector,
  key_version,
  expires_at,
  created_at,
  used_at,
  ip_hash,
  UPPER(encode(ip_hash,'hex')) AS ip_hash_hex,
  ip_hash_key_version,
  user_agent,
  validator_hash,
  UPPER(encode(validator_hash,'hex')) AS validator_hash_hex
FROM password_resets;
