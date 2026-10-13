-- DESCRIPTION: Calculates total realized revenue and average Customer Lifetime Value (CLV) grouped by referral channel.

WITH account_revenue_lifecycles AS (
    -- Aggregate total historical contract values for each organization
    SELECT 
        a.account_id,
        a.referral_source AS acquisition_channel,
        SUM(COALESCE(s.mrr_amount, 0)) AS cumulative_realized_revenue
    FROM accounts a
    LEFT JOIN subscriptions s ON a.account_id = s.account_id
    GROUP BY 1, 2
)
SELECT 
    acquisition_channel,
    COUNT(account_id) AS total_acquired_customers,
    ROUND(SUM(cumulative_realized_revenue), 2) AS total_realized_revenue,
    ROUND(AVG(cumulative_realized_revenue), 2) AS average_customer_lifetime_value
FROM account_revenue_lifecycles
GROUP BY 1
-- Production Threshold: Filters out low-volume outlier channels to prevent mathematical skewing
HAVING total_acquired_customers >= 5  
ORDER BY average_customer_lifetime_value DESC;