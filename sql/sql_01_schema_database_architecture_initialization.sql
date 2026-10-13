--Sets up the core relational table structures with designated data types, primary keys, and relationships across 5 relational tables (accounts, subscriptions, feature_usage, churn_events, and support_tickets).

CREATE TABLE accounts (account_id TEXT PRIMARY KEY, account_name TEXT, industry TEXT, country TEXT, signup_date TEXT, referral_source TEXT, plan_tier TEXT, seats INTEGER, is_trial TEXT, churn_flag TEXT);
CREATE TABLE subscriptions (subscription_id TEXT PRIMARY KEY, account_id TEXT, start_date TEXT, end_date TEXT, plan_tier TEXT, seats INTEGER, mrr_amount REAL, arr_amount REAL, is_trial TEXT, upgrade_flag TEXT, downgrade_flag TEXT, churn_flag TEXT, billing_frequency TEXT, auto_renew_flag TEXT);
CREATE TABLE feature_usage (usage_id TEXT, subscription_id TEXT, usage_date TEXT, feature_name TEXT, usage_count INTEGER, usage_duration_secs INTEGER, error_count INTEGER, is_beta_feature TEXT);
CREATE TABLE churn_events (churn_event_id TEXT PRIMARY KEY, account_id TEXT, churn_date TEXT, reason_code TEXT, refund_amount_usd REAL, preceding_upgrade_flag TEXT, preceding_downgrade_flag TEXT, is_reactivation TEXT, feedback_text TEXT);
CREATE TABLE support_tickets (ticket_id TEXT PRIMARY KEY, account_id TEXT, submitted_at TEXT, closed_at TEXT, resolution_time_hours REAL, priority TEXT, first_response_time_minutes INTEGER, satisfaction_score REAL, escalation_flag TEXT);

