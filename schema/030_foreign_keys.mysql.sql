-- Auto-generated from schema-map-mysql.yaml
-- engine: mysql
-- table:  password_resets

ALTER TABLE password_resets ADD CONSTRAINT fk_pr_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE;

