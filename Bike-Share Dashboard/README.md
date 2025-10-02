🚴‍♂️  Bike Share Performance Dashboard
📊 Project Overview

The Bike Share Dashboard is an interactive business intelligence project built with SQL Server and Power BI to analyze key performance metrics of a fictional bike-sharing company over 2021–2022.

The project demonstrates how raw transactional data from a SQL database can be transformed into actionable business insights using SQL for data preparation and Power BI for visualization.

🎯 Objectives

This project was designed to help stakeholders answer crucial business questions and support strategic decision-making. Specifically, it focuses on:

🕒 Hourly Revenue Analysis – Identifying the most profitable hours of the day

📈 Profit and Revenue Trends – Understanding how financial performance evolves over time

🍂 Seasonal Revenue Analysis – Revealing which seasons generate the most revenue

👤 Rider Demographics – Breaking down user types (casual vs registered)

🗄️ Data Pipeline

The project follows a SQL → Power BI workflow:

Data Source: Raw data stored in a SQL Server database (bike_data)

Data Preparation: SQL queries were used to clean, merge, and calculate key metrics

Data Modeling: The prepared dataset was imported into Power BI

Visualization: Dashboards and interactive visuals were created in Power BI

 SQL Data Preparation

Below is an example of the SQL query used to combine yearly data, calculate revenue and profit, and prepare the dataset for visualization:

USE bike_data;

WITH sm AS (
    SELECT * FROM bike_share_0
    UNION ALL
    SELECT * FROM bike_share_yr_1
)
SELECT  
    dteday,
    season,
    a.yr,
    weekday,
    hr,
    rider_type,
    riders,
    price,
    COGS,
    riders * price AS revenue,
    riders * price - COGS AS profit
FROM sm a
LEFT JOIN cost_table b
    ON a.yr = b.yr;


📌 This query:

Combines data from multiple yearly tables (bike_share_0, bike_share_yr_1)

Joins cost information from cost_table

Calculates revenue and profit for each record

📊 Dashboard Features
🕐 Hourly Revenue Analysis

Highlights revenue distribution across different hours and days

Identifies peak earning periods (typically 10 AM – 3 PM)

📈 KPI Trends Over Time

Visualizes riders, revenue, and profit month-by-month

Helps track performance and identify growth or decline patterns

🍂 Seasonal Revenue Breakdown

Compares revenue across all four seasons

Provides insights into seasonal demand and resource allocation

👤 Rider Demographics

Displays the proportion of casual vs. registered riders

Shows that registered riders make up ~81% of total users

🧠 Business Insights

🚀 Midday hours consistently generate the highest revenue

📆 Summer and fall seasons yield the most profit

👤 Registered riders form the majority of the customer base (~81%)

💡 Promotions during low-traffic hours and off-seasons could improve overall revenue

🛠️ Tools & Technologies

SQL Server – Data storage and transformation

T-SQL – Querying and data preparation

Power BI Desktop – Data visualization and dashboard development

📁 Repository Structure
📂 toman-bike-share-sql-powerbi
│
├─ 📜 queries/
│   └─ bike_share_query.sql         # SQL scripts used for data preparation
├─ 📊 Toman_Bike_Share_Dashboard.pbix  # Power BI report file
├─ 📸 dashboard_preview.png         # Screenshot of the dashboard
└─ 📘 README.md                     # Project documentation

🚀 How to Use

Clone this repository

Run the SQL script (bike_share_query.sql) in your SQL Server environment

Load the resulting dataset into Power BI Desktop

Open Toman_Bike_Share_Dashboard.pbix to explore the dashboard

📸 Dashboard Preview

<img width="1218" height="594" alt="bike_share powerbi preview" src="https://github.com/user-attachments/assets/1d19b819-beeb-4712-9acc-103d159046b4" />

✍️ Author

Yusuf Abdulsobur – Data Analyst | Power BI Developer
