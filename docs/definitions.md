# password_resets

Password reset tokens for users.

## Columns
| Column | Type | Null | Default | Description |
| --- | --- | --- | --- | --- |
| id | BIGINT | NO |  | Surrogate primary key. |
| user_id | BIGINT | NO |  | Related user (FK users.id). |
| token_hash | CHAR(64) | YES |  | Full token hash (hex/char). |
| selector | CHAR(12) | NO |  | Short public selector (unique). |
| validator_hash | mysql: BINARY(32) / postgres: BYTEA | YES |  | Hashed validator part. |
| key_version | VARCHAR(64) | YES |  | Key version used for hashing/encryption. |
| expires_at | mysql: DATETIME(6) / postgres: TIMESTAMPTZ(6) | NO |  | Expiration timestamp (UTC). |
| created_at | mysql: DATETIME(6) / postgres: TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | Creation timestamp (UTC). |
| used_at | mysql: DATETIME(6) / postgres: TIMESTAMPTZ(6) | YES |  | When token was used, if so. |
| ip_hash | mysql: BINARY(32) / postgres: BYTEA | YES |  | Hashed requester IP. |
| ip_hash_key_version | VARCHAR(64) | YES |  | Key version for ip_hash. |
| user_agent | VARCHAR(1024) | YES |  | Requester user agent. |

## Engine Details

### mysql

Unique keys:
| Name | Columns |
| --- | --- |
| ux_pr_selector | selector |

Indexes:
| Name | Columns | SQL |
| --- | --- | --- |
| idx_pr_expires | expires_at | INDEX idx_pr_expires (expires_at) |
| idx_pr_ip_hash | ip_hash | INDEX idx_pr_ip_hash (ip_hash) |
| idx_pr_used | used_at | INDEX idx_pr_used (used_at) |
| idx_pr_user | user_id | INDEX idx_pr_user (user_id) |
| ux_pr_selector | selector | UNIQUE KEY ux_pr_selector (selector) |

Foreign keys:
| Name | Columns | References | Actions |
| --- | --- | --- | --- |
| fk_pr_user | user_id | users(id) | ON DELETE CASCADE |

### postgres

Unique keys:
| Name | Columns |
| --- | --- |
| ux_pr_selector | selector |

Indexes:
| Name | Columns | SQL |
| --- | --- | --- |
| idx_pr_expires | expires_at | CREATE INDEX IF NOT EXISTS idx_pr_expires ON password_resets (expires_at) |
| idx_pr_ip_hash | ip_hash | CREATE INDEX IF NOT EXISTS idx_pr_ip_hash ON password_resets (ip_hash) |
| idx_pr_used | used_at | CREATE INDEX IF NOT EXISTS idx_pr_used ON password_resets (used_at) |
| idx_pr_user | user_id | CREATE INDEX IF NOT EXISTS idx_pr_user ON password_resets (user_id) |
| ux_pr_selector | selector | CREATE UNIQUE INDEX IF NOT EXISTS ux_pr_selector ON password_resets (selector) |

Foreign keys:
| Name | Columns | References | Actions |
| --- | --- | --- | --- |
| fk_pr_user | user_id | users(id) | ON DELETE CASCADE |

## Engine differences

## Views
| View | Engine | Flags | File |
| --- | --- | --- | --- |
| vw_password_resets | mysql | algorithm=MERGE, security=INVOKER | [../schema/040_views.mysql.sql](../schema/040_views.mysql.sql) |
| vw_password_resets | postgres |  | [../schema/040_views.postgres.sql](../schema/040_views.postgres.sql) |
