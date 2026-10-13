-- Standardizes empty cell entries ('') across date columns into operational database NULL pointers. Run alongside a validation query confirming 0 remaining uncleaned values across active collections.

-- 1. Standardize empty operational fields to NULL
UPDATE subscriptions SET end_date = NULL WHERE end_date = '';
UPDATE churn_events SET churn_date = NULL WHERE churn_date = '';
UPDATE support_tickets SET closed_at = NULL WHERE closed_at = '';

-- 2. Verify changes by checking for remaining uncleaned empty strings
SELECT 'subscriptions_uncleaned' AS check_type, COUNT(*) AS uncleaned_count FROM subscriptions WHERE end_date = ''
UNION ALL
SELECT 'churn_events_uncleaned', COUNT(*) FROM churn_events WHERE churn_date = ''
UNION ALL
SELECT 'support_tickets_uncleaned', COUNT(*) FROM support_tickets WHERE closed_at = '';
