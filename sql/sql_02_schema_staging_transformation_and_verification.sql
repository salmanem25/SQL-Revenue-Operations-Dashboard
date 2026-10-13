-- Runs an initial pass to clean up empty import values and aggregates database row counts via a UNION ALL validation query to verify overall table population sizes.

-- 2. TRANSFORMATION: Convert CSV empty strings into true database NULL values
UPDATE subscriptions SET end_date = NULL WHERE end_date = '';
UPDATE churn_events SET churn_date = NULL WHERE churn_date = '';
UPDATE support_tickets SET closed_at = NULL WHERE closed_at = '';

-- Run a row verification breakdown to ensure data parity
SELECT 'accounts' AS table_name, COUNT(*) AS row_count FROM accounts
UNION ALL
SELECT 'subscriptions', COUNT(*) FROM subscriptions
UNION ALL
SELECT 'feature_usage', COUNT(*) FROM feature_usage
UNION ALL
SELECT 'churn_events', COUNT(*) FROM churn_events
UNION ALL
SELECT 'support_tickets', COUNT(*) FROM support_tickets;