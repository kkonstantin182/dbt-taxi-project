# 🚖 Chicago Taxi Tips Analysis 💰  

This project leverages **BigQuery** as a data warehouse, **dbt** for data transformation, and **Google Sheets** for final storage and visualization.  

### 🔍 Overview  
Using the **‘Chicago Taxi Trips’** dataset from BigQuery, the project identifies the **top 3 drivers** who earned the highest total tips in **April 2018**.  

The transformation layer in **dbt** then tracks how their earnings evolved over time, aggregating tips by **year and month** to calculate the percentage change. The final results are stored in **Google Sheets**, where an interactive visualization brings the insights to life.  

📊 **Explore the dashboard here:** [Google Sheets Link](https://docs.google.com/spreadsheets/d/1SsdCq5w2Ci0W8gOLWCuN43CIYQmUgR7GXdhiioHVGCE/edit?usp=sharing)  

> ⚠️ *Note: If the sheet is empty, my Google Cloud free trial has expired.*
