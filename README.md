## SaaS Revenue Operations & Product Engagement Data Pipeline
#### Relational Ingestion, Data Quality Assurance, and Unit Economics Dashboards

**Author:** Salman Rashid
**Project:** SQL-Revenue-Operations-Dashboard
**Output:** `generate_charts.py` → Executive Metrics Visualization

---

### 1. Overview

This project builds an end-to-end production data engineering and business intelligence pipeline. It extracts relational SaaS transactional data across 5 tables, transforms unoptimized string variants, calculates core product-revenue metrics, and compiles automated visualization summaries.

**Hypothesis:** Inbound organic and structured partner channels deliver superior customer lifetime value economics and show higher product feature engagement density than top-of-funnel paid advertisement frameworks.

The analysis combines:

| Source | Variable(s) | Method |
|---|---|---|
| Accounts & Subscriptions | MRR, ARR, firmographic profiles, entry channels, plan tiers | Relational schema definition (DDL) and foreign keys |
| Feature Usage Logs | Daily interaction counts, duration seconds, active states | Time-series chronological logging |
| Churn & Support Data | Retention velocity trackers, ticket resolution hours, satisfaction scores | Lifecycle exception logging |
| Visual Dashboard Engine | Dual-axis trends, horizontal unit economic value indexes | Python integration (Pandas, Matplotlib) |

All sources are merged into structured local staging tables (`accounts`, `subscriptions`, `feature_usage`, etc.) via sequential relational operations including multi-conditional left joins, CTE data windows, and aggregation parameter thresholds. 

---

### 2. Repository Contents

```
.
├── dashboard/
│   ├── generate_charts.py                                      # Programmatic visualization compiler script
│   └── dashboard_snapshot.png                                  # Generated executive graphic asset layer
├── data/
│   ├── ravenstack_accounts.csv                                 # Raw source transactional files
│   ├── ravenstack_churn_events.csv
|   ├── ravenstack_feature_usage.csv
|   ├── ravenstack_subscriptions.csv
|   └── ravenstack_support_tickets.csv
|
├── results/
│   ├── mau_trend.txt                                           # Aggregated time-series query outputs
│   ├── cohort_retention_metrics.txt
|   └── acquisition_channel_total_acquired.txt
|
├── sql/
│   ├── ravenstack.db                                           # Compiled SQLite active target database
│   ├── sql_01_schema_database_architecture_initialization      # Database architecture initialization (DDL)
│   ├── sql_02_schema_staging_transformation_and_verification   # Ingestion QA & row verification sequences
│   ├── sql_03_schema_table_mapping_alignment                   # Post-import schema mapping configurations
│   ├── sql_04_schema_production_data_cleaning                  # Data validation and NULL conversions
│   ├── sql_05_schema_monthly_active_users_(MAU)_trend_line     # Query 1: Monthly Active Users trend calculations
│   ├── sql_06_schema_cohort_retention_metrics                  # Query 2: Cohort retention survival curve scripts
│   └── sql_07_schema_clv_by_channel                            # Query 3: CLV analysis by acquisition channel
└── README.md                                                   # This file
```

---

### 3. Setup

#### 3.1 Software Requirements
- DB Browser for SQLite (or standard command-line SQLite client engine)
- Python ≥ 3.8
- A package manager client (pip) to handle visual dependency rendering

#### 3.2 Python Ingestion Libraries
```bash
pip install pandas numpy matplotlib
```

#### 3.3 Database Mounting
Data rows should be initialized directly within the engine environment. Run your data definition structures sequentially to initialize table constraints and ensure standard type safety guidelines are met.

---

### 4. How to Run

1. Open your SQL client app and execute `sql_01_schema.sql` to compile your structural database tables.
2. Ingest your source CSV files using your database engine's manual import wizard interface.
3. Pass scripts `sql_02` through `sql_04` in numeric sequence to parse empty text fields into native relational `NULL` flags.
4. Run analytical compute scripts `sql_05` through `sql_07` to extract key aggregation buffers.
5. Move into your command terminal prompt and execute the visualization compiler engine:
   ```bash
   python dashboard/generate_charts.py
   ```
6. The compiled single-page output graphic asset file will automatically appear inside the `/dashboard` folder path.

---

### 5. Code Style

SQL execution parameters utilize capitalized commands, clear indentation spacing markers, and isolated statement blocks. Python pipeline processes follow PEP 8 compliance rules, organizing code blocks cleanly from early manual text block buffers into clean target pandas dataframes.

---

### 6. Methodology Notes

- **Data Sanitation Layer:** SQLite maps missing string characters from raw CSV text records as simple empty strings (`''`). This pipeline deploys explicit database scrubbing operations to parse these items into native `NULL` states before initiating metric processing routines.
- **Unbalanced Contract Horizons:** Customer lifecycle data contains recurring subscription paths and varying service contract gaps. Retention calculations deploy subscription-level start points rather than account-level general signups to ensure zero timeline distortion.
- **Scale Threshold Isolation:** Unit economics evaluation scripts apply an operational volume constraint condition (`HAVING total_acquired_customers >= 5`) to prevent low-volume marketing outlier pipelines from skewing statistical calculations.

---

### 7. Results Summary

- **Product Engagement Volatility:** Product active floor usage remains exceptionally strong, maintaining a steady baseline fluctuating between **850 and 1,025 active monthly subscriptions**. A peak operations count occurred in **October 2024 (2024-10)** with **1,027 active subscriptions** and **11,450 feature actions**.
- **Unit Economics Yield:** Inbound **Organic Traffic** represents the premium client cohort segment, delivering a superior lifetime economic valuation of **\$24,550.06 average revenue** across 114 companies. 
- **B2B Channel Tiering:** **Partner Networks** trail closely as a highly lucrative mid-tier acquisition asset, matching scale with an average contract value of **\$23,530.82**. Conversely, broad **Paid Ads (\$21,904.28) and Event Activations (\$20,015.10)** return significantly lower lifetime revenue performance tiers.
- **Strategic Recommendation:** Shift capital budget outlays away from top-of-funnel broad public marketing sponsorships and broad paid advertising channels. Reallocate financial capital into organic SEO infrastructures and co-marketed partner networks to optimize total realized revenue.

---

### 8. Known Limitations

- **Snapshot Inferences:** Since system feature interactions are aggregated at log level points, true daily distinct timeline click counts remain abstract.
- **Heterogeneity Bounds:** Standard analytical scripts group baseline company cohorts linearly without weighting underlying team seat allocations or custom pricing negotiations.

---

### 9. References

- INRIX Global Mobility (2018-2024). *Enterprise Traffic Scorecard Framework Metrics.*
- Python Data Science Team (2026). *Pandas, NumPy, and Matplotlib Object Model API Reference Guidelines.*
- SQLite Project Group (2026). *Structured Storage Engine Layout, Foreign Key Mappings, and Relational Processing Optimization Documentation.*

---

### 10. License

Developed for enterprise business intelligence evaluations and portfolio evaluation procedures. All reproduction rights remain open.