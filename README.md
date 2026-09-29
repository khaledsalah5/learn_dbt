# Airbnb Analytics Engineering Project — dbt + Snowflake

## Overview

This repository is a hands-on **dbt analytics engineering project** built on top of Airbnb-style data in **Snowflake**.

The project focuses on transforming raw warehouse data into clean, tested, documented, analytics-ready models using modular SQL and dbt best practices.

The main transformation flow is:

```text
Raw Snowflake Sources
        │
        ▼
Source Models (ephemeral)
        │
        ▼
Dimension Models
        │
        ├── Hosts
        └── Listings
        │
        ▼
Fact Models
        │
        └── Reviews
        │
        ▼
Analytics / Mart Models
```

Orchestration is intentionally outside the scope of this repository; the focus is on **dbt transformations, testing, documentation, lineage, and reusable modeling patterns**.

---

## Tech Stack

- **dbt Core**
- **Snowflake**
- **SQL**
- **Jinja**
- **YAML**
- **dbt Packages**
- **dbt Tests**
- **dbt Documentation**
- **Git / GitHub**

---

## Project Structure

```text
learn_dbt/
│
├── models/
│   ├── src/
│   │   ├── src_hosts.sql
│   │   ├── src_listings.sql
│   │   └── src_reviews.sql
│   │
│   ├── dim/
│   │   ├── dim_hosts_cleansed.sql
│   │   ├── dim_listings_cleansed.sql
│   │   └── dim_listings_W_hosts.sql
│   │
│   ├── fct/
│   │   └── fct_reviews.sql
│   │
│   ├── mart/
│   │   └── full_moon_review.sql
│   │
│   ├── sources.yml
│   ├── schema.yml
│   └── docs.md
│
├── analyses/
├── macros/
├── seeds/
├── snapshots/
├── tests/
├── assets/
├── dbt_project.yml
├── packages.yml
└── README.md
```

---

## Model Layers

### Source Layer

The `models/src` layer defines lightweight transformations over raw Airbnb source tables.

Current source models include:

- `src_hosts.sql`
- `src_listings.sql`
- `src_reviews.sql`

The project config materializes this layer as **ephemeral**, allowing dbt to inline these transformations into downstream models instead of creating separate physical warehouse objects.

---

### Dimension Layer

The dimension layer cleans and prepares reusable descriptive entities for analytics.

Models include:

- `dim_hosts_cleansed.sql`
- `dim_listings_cleansed.sql`
- `dim_listings_W_hosts.sql`

The project config materializes dimension models as **tables**.

This makes them suitable for repeated downstream analytical queries while keeping business logic centralized.

---

### Fact Layer

`fct_reviews.sql` represents the review activity at fact-table grain.

The fact model can be combined with the cleaned host and listing dimensions to support analytical queries around:

- listing activity;
- host behavior;
- customer reviews;
- occupancy-related analysis;
- time-based trends.

---

### Mart Layer

The `models/mart` directory contains higher-level business models built on top of the reusable source, dimension, and fact layers.

The current mart model is:

```text
full_moon_review.sql
```

This demonstrates how business-specific analytics can be separated from lower-level transformation logic.

---

## Materialization Strategy

The project demonstrates different dbt materialization strategies.

From `dbt_project.yml`:

```text
Default models  → View
Dimension layer → Table
Source layer    → Ephemeral
```

This illustrates an important dbt design principle: different layers can use different persistence strategies based on performance, reusability, and warehouse requirements.

---

## Sources

Raw data sources are defined in:

```text
models/sources.yml
```

Using dbt sources provides a controlled interface between raw warehouse objects and transformation models.

Benefits include:

- clearer lineage;
- centralized raw-table definitions;
- source-level documentation;
- easier source testing;
- simpler downstream references using `source()`.

---

## Data Quality & Testing

Data-quality rules are defined through dbt tests and YAML configuration.

The project demonstrates concepts such as:

- generic tests;
- singular tests;
- uniqueness validation;
- non-null validation;
- relationship testing;
- model-level documentation;
- source validation.

Tests can be executed with:

```bash
dbt test
```

Or together with model execution:

```bash
dbt build
```

---

## dbt Packages

External dbt packages are managed through:

```text
packages.yml
```

Install package dependencies with:

```bash
dbt deps
```

This allows reusable macros and testing utilities to be integrated into the project rather than rebuilding common functionality from scratch.

---

## Documentation & Lineage

The repository includes model and column documentation through Markdown and YAML files.

Generate the dbt documentation site with:

```bash
dbt docs generate
dbt docs serve
```

dbt Docs provides:

- model descriptions;
- column descriptions;
- source definitions;
- tests;
- dependency relationships;
- interactive lineage graphs.

This makes the transformation pipeline easier to understand and maintain.

---

## Snowflake Permissions

The project includes a post-hook in `dbt_project.yml`:

```sql
grant select on {{this}} to role reporter
```

After models are created, dbt automatically grants read access to the configured `reporter` role.

This demonstrates how warehouse permissions can be incorporated into transformation workflows instead of being handled entirely as a separate manual step.

---

## How to Run

### 1. Clone the repository

```bash
git clone https://github.com/khaledsalah5/learn_dbt.git
cd learn_dbt
```

### 2. Install dbt for Snowflake

Use a Python virtual environment if possible.

```bash
pip install dbt-snowflake
```

### 3. Configure the dbt profile

The project expects a profile named:

```text
dbtlearn
```

Configure the Snowflake connection in your local `profiles.yml`.

Credentials should **not** be committed to the repository.

### 4. Install packages

```bash
dbt deps
```

### 5. Test the connection

```bash
dbt debug
```

### 6. Build the models

```bash
dbt build
```

Or run transformations separately:

```bash
dbt run
```

### 7. Run tests

```bash
dbt test
```

### 8. Generate documentation

```bash
dbt docs generate
dbt docs serve
```

---

## Data Engineering / Analytics Engineering Concepts Demonstrated

This project demonstrates practical experience with:

- ELT architecture;
- modular SQL transformations;
- source-to-mart modeling;
- dimensional modeling;
- dbt model dependencies;
- Jinja templating;
- data-quality testing;
- reusable macros and packages;
- warehouse permission automation;
- documentation and lineage;
- analytics-ready data modeling;
- separation of raw, transformation, and business layers.

---

## Business Use Case

The project models Airbnb-style datasets to support analytics such as:

- host and listing analysis;
- review trends;
- listing performance;
- occupancy-related analysis;
- geographic and behavioral reporting;
- reusable datasets for BI tools.

The goal is to convert raw warehouse data into trusted, documented datasets that downstream analysts and BI applications can use reliably.

---

# 💫 About Me:
🔭 I’m currently working on: Building scalable data pipelines and cloud-based data platforms using Python, PySpark, SQL, dbt, and GCP.<br>
👯 I’m looking to collaborate on: Data Engineering, ETL/ELT, Big Data, Cloud, and open-source data projects.<br>
🤝 I’m looking for help with: Advanced Data Engineering architectures, real-time streaming, and scalable cloud solutions.<br>
🌱 I’m currently learning: Advanced dbt, Databricks, Apache Spark, Kafka, Terraform, and modern DataOps practices.<br>
💬 Ask me about: Python, SQL, PySpark, dbt, BigQuery, GCP, ETL/ELT pipelines, Apache Airflow, and Data Engineering.<br>
⚡ Fun fact: I enjoy turning messy raw data into clean, reliable pipelines—and explaining how they work to others.

## 🌐 Socials:
[![Facebook](https://img.shields.io/badge/Facebook-%231877F2.svg?logo=Facebook&logoColor=white)](https://facebook.com/khaled.salah5148) [![Instagram](https://img.shields.io/badge/Instagram-%23E4405F.svg?logo=Instagram&logoColor=white)](https://instagram.com/khaled_salah5148) [![LinkedIn](https://img.shields.io/badge/LinkedIn-%230077B5.svg?logo=linkedin&logoColor=white)](https://linkedin.com/in/khaled-salah5148) [![email](https://img.shields.io/badge/Email-D14836?logo=gmail&logoColor=white)](mailto:khaled.salah2803@gmail.com)

# 💻 Tech Stack:
![C++](https://img.shields.io/badge/c++-%2300599C.svg?style=for-the-badge&logo=c%2B%2B&logoColor=white) ![Markdown](https://img.shields.io/badge/markdown-%23000000.svg?style=for-the-badge&logo=markdown&logoColor=white) ![PowerShell](https://img.shields.io/badge/PowerShell-%235391FE.svg?style=for-the-badge&logo=powershell&logoColor=white) ![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54) ![Google Cloud](https://img.shields.io/badge/GoogleCloud-%234285F4.svg?style=for-the-badge&logo=google-cloud&logoColor=white) ![Azure](https://img.shields.io/badge/azure-%230072C6.svg?style=for-the-badge&logo=microsoftazure&logoColor=white) ![Apache Kafka](https://img.shields.io/badge/Apache%20Kafka-000?style=for-the-badge&logo=apachekafka) ![Apache Spark](https://img.shields.io/badge/Apache%20Spark-FDEE21?style=for-the-badge&logo=apachespark&logoColor=black) ![Apache Hive](https://img.shields.io/badge/Apache%20Hive-FDEE21?style=for-the-badge&logo=apachehive&logoColor=black) ![Apache Hadoop](https://img.shields.io/badge/Apache%20Hadoop-66CCFF?style=for-the-badge&logo=apachehadoop&logoColor=black) ![Jinja](https://img.shields.io/badge/jinja-white.svg?style=for-the-badge&logo=jinja&logoColor=black) ![Snowflake](https://img.shields.io/badge/snowflake-%2329B5E8.svg?style=for-the-badge&logo=snowflake&logoColor=white) ![Apache Airflow](https://img.shields.io/badge/Apache%20Airflow-017CEE?style=for-the-badge&logo=Apache%20Airflow&logoColor=white) ![Jenkins](https://img.shields.io/badge/jenkins-%232C5263.svg?style=for-the-badge&logo=jenkins&logoColor=white) ![Postgres](https://img.shields.io/badge/postgres-%23316192.svg?style=for-the-badge&logo=postgresql&logoColor=white) ![MySQL](https://img.shields.io/badge/mysql-4479A1.svg?style=for-the-badge&logo=mysql&logoColor=white) ![MongoDB](https://img.shields.io/badge/MongoDB-%234ea94b.svg?style=for-the-badge&logo=mongodb&logoColor=white) ![MicrosoftSQLServer](https://img.shields.io/badge/Microsoft%20SQL%20Server-CC2927?style=for-the-badge&logo=microsoft%20sql%20server&logoColor=white) ![Canva](https://img.shields.io/badge/Canva-%2300C4CC.svg?style=for-the-badge&logo=Canva&logoColor=white) ![Figma](https://img.shields.io/badge/figma-%23F24E1E.svg?style=for-the-badge&logo=figma&logoColor=white) ![GitHub Actions](https://img.shields.io/badge/github%20actions-%232671E5.svg?style=for-the-badge&logo=githubactions&logoColor=white) ![Git](https://img.shields.io/badge/git-%23F05033.svg?style=for-the-badge&logo=git&logoColor=white) ![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white) ![Playwright](https://img.shields.io/badge/-playwright-%232EAD33?style=for-the-badge&logo=playwright&logoColor=white) ![Selenium](https://img.shields.io/badge/-selenium-%43B02A?style=for-the-badge&logo=selenium&logoColor=white) ![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white) ![Kubernetes](https://img.shields.io/badge/kubernetes-%23326ce5.svg?style=for-the-badge&logo=kubernetes&logoColor=white) ![Power Bi](https://img.shields.io/badge/power_bi-F2C811?style=for-the-badge&logo=powerbi&logoColor=black) ![Splunk](https://img.shields.io/badge/splunk-%23000000.svg?style=for-the-badge&logo=splunk&logoColor=white) ![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)

# 📊 GitHub Stats:
![](https://github-readme-stats.shion.dev/api?username=khaledsalah5&theme=github_dark&hide_border=true&include_all_commits=true&count_private=false)<br/>
![](https://streak-stats.demolab.com/?user=khaledsalah5&theme=github_dark&hide_border=true)<br/>
![](https://github-readme-stats.shion.dev/api/top-langs/?username=khaledsalah5&theme=github_dark&hide_border=true&include_all_commits=true&count_private=false&layout=compact)

### ✍️ Random Dev Quote
![](https://quotes-github-readme.vercel.app/api?type=horizontal&theme=radical)

---
[![](https://komarev.com/ghpvc/?username=khaledsalah5&icon=0&color=0)](https://visitcount.itsvg.in)
