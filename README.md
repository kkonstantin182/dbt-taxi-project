# 🚖 Chicago Taxi Tips Analysis 💰  

## 🛠️ Technologies Used  
<p align="left">

  <img src="https://github.com/kkonstantin182/dbt-taxi-project/blob/main/images/bigquery_logo.png" alt="BigQuery" height="120">  
  <img src="https://github.com/kkonstantin182/dbt-taxi-project/blob/main/images/dbt_logo.png" alt="dbt" height="120">  
  <img src="https://github.com/kkonstantin182/dbt-taxi-project/blob/main/images/googlesheet_logo.png" alt="Google Sheets" height="120">  
  <img src="https://github.com/kkonstantin182/dbt-taxi-project/blob/main/images/terraform_logo.png" alt="Terraform" height="120">  
</p>  

- **BigQuery** – Data warehouse for storing and querying large datasets  
- **dbt** – Data transformation tool for modeling and managing data pipelines  
- **Google Sheets** – Used for storing final processed data and visualization  
- **Terraform** – Infrastructure as Code (IaC) tool used to manage BigQuery infrastructure

## 🔍 Overview  
This project leverages **BigQuery** as a data warehouse, **dbt** for data transformation, and **Google Sheets** for final storage and visualization.  

Using the **‘Chicago Taxi Trips’** dataset from BigQuery, the project identifies the **top 3 drivers** who earned the highest total tips in **April 2018**.  

The transformation layer in **dbt** then tracks how their earnings evolved over time, aggregating tips by **year and month** to calculate the percentage change. The final model is **incremental**, ensuring that only new data is processed to optimize performance and reduce data usage. The final results are stored in **Google Sheets**, where an interactive visualization brings the insights to life.  

📊 **Explore the dashboard here:** [Google Sheets Link](https://docs.google.com/spreadsheets/d/1SsdCq5w2Ci0W8gOLWCuN43CIYQmUgR7GXdhiioHVGCE/edit?usp=sharing)  

> ⚠️ *Note: If the sheet is empty, my Google Cloud free trial has expired.*

## Data Transformation Layer (dbt)

The data transformation is structured through a series of dbt models:

- **`stg_taxi_trips`**: A staging model that contains raw taxi trip data.
- **`top_three_cars`**: Identifies the top three drivers who received the highest total tips in April 2018.
- **`tips_change_with_time`**: An incremental model that aggregates data by `year_month`, calculating the total tips for each driver and computing the percentage change in tips over time.

![Data Pipeline](https://github.com/kkonstantin182/dbt-taxi-project/blob/main/images/dbt_schema.PNG)

