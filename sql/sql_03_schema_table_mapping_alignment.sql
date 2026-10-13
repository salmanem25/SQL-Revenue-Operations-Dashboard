-- Drops empty placeholder schema tables and renames populated staging tables (prefixed with ravenstack_) to standard target names to ensure strict alignment with core queries.

-- 1. Drop the empty placeholder tables created in schema 1
DROP TABLE IF EXISTS accounts;
DROP TABLE IF EXISTS subscriptions;
DROP TABLE IF EXISTS feature_usage;
DROP TABLE IF EXISTS churn_events;
DROP TABLE IF EXISTS support_tickets;

-- 2. Rename your actual imported data tables to match your production queries
ALTER TABLE ravenstack_accounts RENAME TO accounts;
ALTER TABLE ravenstack_subscriptions RENAME TO subscriptions;
ALTER TABLE ravenstack_feature_usage RENAME TO feature_usage;
ALTER TABLE ravenstack_churn_events RENAME TO churn_events;
ALTER TABLE ravenstack_support_tickets RENAME TO support_tickets;

