-- Formats chronological time-series dates into standardized operational months. Computes unique monthly active sub-identities (COUNT(DISTINCT)) alongside aggregated system core feature interactions.

SELECT 
    STRFTIME('%Y-%m', usage_date) AS operational_month,
    COUNT(DISTINCT subscription_id) AS monthly_active_subscriptions,
    SUM(usage_count) AS total_feature_interactions
FROM feature_usage
GROUP BY 1
ORDER BY 1 ASC;