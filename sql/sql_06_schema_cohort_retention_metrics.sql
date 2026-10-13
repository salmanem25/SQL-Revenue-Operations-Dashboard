-- Utilizes two Common Table Expressions (CTEs) to map unique subscription lifecycles to their active application periods. Subtracts start dates from active dates to build a cohort table mapping retention trends from Month 0 onward.

WITH cohort_definition AS (
    -- Identify the baseline starting month for each unique subscription
    SELECT 
        subscription_id,
        account_id,
        STRFTIME('%Y-%m', start_date) AS cohort_month
    FROM subscriptions
),
active_months AS (
    -- Group system usage to locate active months per unique subscription contract
    SELECT DISTINCT 
        subscription_id,
        STRFTIME('%Y-%m', usage_date) AS activity_month
    FROM feature_usage
)
SELECT 
    c.cohort_month,
    -- Calculate interval variance in months between contract baseline and activity
    (CAST(SUBSTR(a.activity_month, 1, 4) AS INT) - CAST(SUBSTR(c.cohort_month, 1, 4) AS INT)) * 12 +
    (CAST(SUBSTR(a.activity_month, 6, 2) AS INT) - CAST(SUBSTR(c.cohort_month, 6, 2) AS INT)) AS month_number,
    COUNT(DISTINCT c.account_id) AS retained_accounts
FROM cohort_definition c
JOIN active_months a ON c.subscription_id = a.subscription_id
GROUP BY 1, 2
-- Eliminates structural timeline overlaps
HAVING month_number >= 0  
ORDER BY 1, 2;