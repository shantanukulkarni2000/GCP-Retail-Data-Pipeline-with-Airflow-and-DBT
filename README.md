# 🚀 Airflow Retail Data Pipeline

A modern, production-ready data pipeline for retail analytics using **Apache Airflow**, **dbt**, **Soda**, and **BigQuery**. Designed for Astronomer or any Airflow-compatible environment.

---

## 🗺️ Architecture Overview

```
[CSV File] → [GCS Bucket] → [BigQuery: raw_table] → [Soda check_load]
    → [dbt transform] → [Soda check_transform]
    → [dbt report] → [Soda check_report]
    → [BigQuery: Target Tables] → [BI Dashboard]
```

---

## 📦 Dataset
- **Source:** [Kaggle Online Retail Dataset](https://www.kaggle.com/datasets/tunguz/online-retail)

## 🎯 Project Purpose
A hands-on demonstration of a robust data engineering workflow for retail analytics:
- Automated ingestion of raw retail data from CSV to Google Cloud Storage (GCS)
- Loading and staging data in BigQuery
- Data transformation and modeling using dbt (dimensions, facts, reports)
- Data quality validation at each stage using Soda
- Orchestration and automation with Apache Airflow

## 🛠️ Key Technologies
- **Apache Airflow**: Workflow orchestration and automation
- **Google Cloud Storage (GCS)**: Raw data storage
- **BigQuery**: Cloud data warehouse for scalable analytics
- **dbt**: SQL-based data transformation and modeling
- **Soda**: Data quality and validation

## 💡 Typical Use Cases
- Retail sales analytics
- Customer segmentation and behavior analysis
- Product performance and inventory reporting
- Data quality monitoring in production pipelines

---

## 📁 Project Structure

```text
├── dags/
│   └── retails.py                # Main Airflow DAG for the retail pipeline
├── include/
│   ├── dataset/                  # Source data files
│   ├── dbt/
│   │   ├── models/
│   │   │   ├── transform/        # dbt transformation models
│   │   │   └── report/           # dbt reporting models
│   │   └── sources/              # dbt sources definition
│   ├── gcp/
│   │   └── service.json          # GCP service account (not in version control)
│   └── soda/
│       ├── configuration.yml     # Soda configuration (uses env vars)
│       └── checks/               # Soda data quality checks
├── airflow_settings.yaml         # Local Airflow settings (connections, variables)
├── .env                          # environment variables
├── .gitignore                    # Files/folders to ignore in git
└── README.md                     # Project documentation (this file)
```

---

## ✨ Features
- **Airflow DAG** for orchestrating the retail data pipeline
- **dbt** for data transformation and reporting
- **Soda** for automated data quality checks
- **BigQuery** as the data warehouse
- **Environment variable support** for secrets and configuration
- **Modular and extensible**: Easily add new data sources, models, or checks

---

## ⚡ Quickstart
1. **Clone** this repository.
2. **Copy** `.env.example` to `.env` and fill in your credentials and secrets.
3. **Install** Python and OS dependencies:
   - `pip install -r requirements.txt`
   - Install any OS packages listed in `packages.txt`
4. **Start Airflow** using Astronomer CLI or your preferred method.
5. **Trigger** the `retail` DAG from the Airflow UI.

## 🧪 Data Quality
Soda checks are defined in `include/soda/checks/` and configured via `include/soda/configuration.yml`.

## 🏗️ Data Modeling
- dbt models are in `include/dbt/models/transform/` and `include/dbt/models/report/`
- Sources are defined in `include/dbt/sources/sources.yaml`
- Example models: `dim_customer.sql`, `dim_datetime.sql`, `dim_product.sql`, `fct_invoices.sql`
