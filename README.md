# learn_dbt
this is my first dbt project 
🛠️ Airbnb Data Transformation Project with dbt
This repository contains a hands-on, real-world data transformation project built during the Complete dbt Bootcamp: Zero to Hero course. The project simulates a production-level Airbnb analytics pipeline using dbt (Data Build Tool) and Snowflake.

✅ Orchestration is not included in this repository — focus is solely on dbt core features.

📌 Overview
This project demonstrates how to use dbt to model, test, document, and transform Airbnb data. It follows best practices of analytics engineering and the modern data stack, covering everything from setting up your development environment to deploying modular, testable SQL-based transformations.

🧱 Technologies Used
dbt Core

Snowflake (as the data warehouse)

Visual Studio Code with dbt extensions

Jinja2 Templates

Markdown & YAML

Optional integration with BI tools (e.g., dbt docs, Looker)

📁 Project Structure
Copy
Edit
airbnb-dbt-project/


    ├── models/

        ├── staging/
        ├── marts/
        ├── intermediate/
        └── snapshots/
    
    ├── seeds/
    ├── analyses/
    ├── macros/
    ├── tests/
    ├── dbt_project.yml
    ├── packages.yml
    └── README.md

🚀 Key Features & Concepts

✅ Core dbt Concepts
Models with different materializations: view, table, incremental
Sources for raw Airbnb data
Seeds to load reference/static datasets
Snapshots to capture historical data changes
Packages: added functionality via third-party macros
Exposures and Analyses for documentation & insights

🧪 Testing & Data Quality
Singular and generic dbt tests
Customized built-in tests with config blocks
Advanced tests using dbt-expectations

📚 Documentation
Auto-generated dbt docs site
Custom descriptions and meta tags in YAML files
Explore data lineage and model relationships visually

📊 Business Use Case
The project focuses on Airbnb datasets and simulates how a data team might build a modern ELT pipeline for business reporting, market analysis, and growth metrics.

Use cases include:
Listing and host behavior analysis
Reviews and occupancy trends
Geographic breakdowns of performance

🧠 What I Learned

Connecting dbt to Snowflake and configuring profiles securely
Writing modular SQL using Jinja templating
Implementing SCDs, CTEs, and data versioning
Building reusable macros, advanced filters, and flexible logic

📌 Next Steps

Add orchestration via dbt Cloud / Airflow (coming soon)
Deploy with CI/CD for automated testing and delivery
Connect to a BI layer (e.g., Looker, Power BI, preset )


🧾 References
Complete dbt Bootcamp: Zero to Hero : https://www.udemy.com/course/complete-dbt-data-build-tool-bootcamp-zero-to-hero-learn-dbt/
dbt Documentation
Snowflake Docs
dbt-expectations

👨‍💻 Author
Khaled Salah
Data Engineer
📫 LinkedIn : https://www.linkedin.com/in/khaled-salah5148/
