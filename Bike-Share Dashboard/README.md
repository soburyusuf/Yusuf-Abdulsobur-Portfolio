# 🚴‍♂️ Bike Share Performance Dashboard

## 📊 Project Overview

The **Bike Share Dashboard** is an end-to-end data analytics project built using **SQL Server** and **Power BI** to analyze and visualize key performance metrics for a fictional bike-sharing company.
It demonstrates how raw transactional data can be transformed into actionable insights, guiding business decisions around revenue optimization, rider engagement, and seasonal planning.

This project showcases the complete workflow — from **data extraction and transformation in SQL** to **interactive visualization in Power BI**.

---

## 🎯 Business Objectives

The dashboard was designed to answer critical business questions and guide strategic decision-making:

* 🕒 **Hourly Revenue Analysis** – What are the most profitable hours of the day?
* 📈 **Profit & Revenue Trends** – How does financial performance evolve over time?
* 🍂 **Seasonal Revenue Insights** – Which seasons generate the most revenue?
* 👤 **Rider Demographics** – What is the breakdown between casual and registered riders?

---

## 🗄️ Data Pipeline Workflow

**SQL → Power BI** Workflow:

1. **Data Source:** Raw transactional data stored in a SQL Server database (`bike_data`).
2. **Data Preparation:** Cleaned, merged, and calculated key metrics using T-SQL.
3. **Data Modeling:** Loaded the prepared dataset into Power BI.
4. **Visualization:** Built interactive dashboards with rich visuals and slicers.

---

## 🧠 SQL Data Preparation

Below is the main SQL script used to merge tables, calculate revenue and profit, and prepare the dataset for Power BI visualization:

```sql
-- Select the database
USE bike_data;

-- Combine data from 2021 and 2022 and calculate key metrics
WITH sm AS (
    SELECT * FROM bike_share_0
    UNION ALL
    SELECT * FROM bike_share_yr_1
)
SELECT 
    a.dteday,                     -- Date of ride
    a.season,                     -- Season (1: winter, 2: spring, 3: summer, 4: fall)
    a.yr,                         -- Year
    a.weekday,                    -- Day of the week
    a.hr,                         -- Hour of the day
    a.rider_type,                 -- Casual or Registered
    a.riders,                     -- Number of riders
    a.price,                      -- Price per ride
    b.COGS,                       -- Cost of goods sold
    (a.riders * a.price) AS revenue,                 -- Total revenue
    (a.riders * a.price) - b.COGS AS profit         -- Profit calculation
FROM sm a
LEFT JOIN cost_table b
    ON a.yr = b.yr;
```

✅ **What this query does:**

* Combines historical data from multiple tables (`bike_share_0`, `bike_share_yr_1`).
* Joins cost data from `cost_table`.
* Calculates **revenue** and **profit** for each hour of operation.

---

## 📊 Dashboard Features

### 🕐 Hourly Revenue Analysis

* Visualizes revenue by hour and weekday.
* Highlights peak revenue periods (e.g., **10 AM – 3 PM**).

### 📈 KPI Trends Over Time

* Tracks **riders, revenue, and profit** monthly.
* Identifies growth patterns and declining trends.

### 🍂 Seasonal Revenue Breakdown

* Compares revenue across **Winter, Spring, Summer, and Fall**.
* Provides actionable insights for seasonal planning.

### 👤 Rider Demographics

* Shows the proportion of **casual vs. registered** riders.
* Reveals that registered riders account for ~81% of total users.

---

## 🧠 Key Insights

* 🚀 **Midday hours** consistently generate the highest revenue.
* 📆 **Summer and Fall** seasons yield the highest profit margins.
* 👤 **Registered riders** make up ~81% of the customer base.
* 💡 Marketing promotions during **off-peak hours** and **low seasons** could significantly boost revenue.

---

## 🛠️ Tools & Technologies

* **SQL Server** – Data storage and transformation
* **T-SQL** – Querying and data preparation
* **Power BI Desktop** – Visualization and dashboard development

---

## 📁 Repository Structure

```
toman-bike-share-sql-powerbi/
│
├─ 📜 queries/
│   └─ bike_share_query.sql      # SQL script used for data preparation
│
├─ 📊 Toman_Bike_Share_Dashboard.pbix   # Power BI report file
│
├─ 📸 dashboard_preview.png      # Screenshot of the dashboard
│
└─ 📘 README.md                  # Project documentation (this file)
```

---

## 🚀 How to Use

1. **Clone this repository:**

   ```bash
   git clone https://github.com/yourusername/toman-bike-share-sql-powerbi.git
   ```
2. **Run the SQL script:**
   Execute `bike_share_query.sql` in your SQL Server environment.
3. **Load the dataset into Power BI:**
   Connect Power BI Desktop to your SQL Server and import the prepared data.
4. **Open the dashboard:**
   Explore insights using `Toman_Bike_Share_Dashboard.pbix`.

---

## 📸 Dashboard Preview

<img width="1218" height="594" alt="bike_share powerbi preview" src="https://github.com/user-attachments/assets/1d19b819-beeb-4712-9acc-103d159046b4" />

✍️ Author

Yusuf Abdulsobur – Data Analyst | Power BI Developer
