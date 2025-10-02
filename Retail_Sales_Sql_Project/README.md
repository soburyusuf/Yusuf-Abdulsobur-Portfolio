# 🛍️ Retail Sales Analysis with SQL Server – Project P1

## 📊 Project Overview

This project is a complete **SQL-based data analysis pipeline** focused on exploring, cleaning, and analyzing retail sales data.
The dataset contains detailed transactional records including sale date, customer information, product categories, quantity, and revenue.

The goal of this project is to demonstrate how to use **SQL Server** for:

* Database and table creation
* Data import from CSV files
* Data cleaning and validation
* Exploratory Data Analysis (EDA)
* Business-oriented queries and insights

---

## 🗂️ Dataset Information

The dataset used is a CSV file named:

```
Retail Sales Analysis_utf.csv
```

It contains transactional retail data with the following columns:

| Column Name     | Data Type   | Description                                            |
| --------------- | ----------- | ------------------------------------------------------ |
| transactions_id | INT (PK)    | Unique transaction ID                                  |
| sale_date       | DATE        | Date of sale                                           |
| sale_time       | TIME        | Time of sale                                           |
| customer_id     | INT         | Unique customer identifier                             |
| gender          | VARCHAR(15) | Customer gender                                        |
| age             | INT         | Customer age                                           |
| category        | VARCHAR(15) | Product category (e.g., Clothing, Electronics, Beauty) |
| quantity        | INT         | Number of units sold                                   |
| price_per_unit  | FLOAT       | Price per unit item                                    |
| cogs            | FLOAT       | Cost of goods sold                                     |
| total_sale      | FLOAT       | Total revenue from the transaction                     |

---

## 🏗️ Project Workflow

### 1. 📦 Database and Table Creation

```sql
CREATE DATABASE sql_project_p1;

CREATE TABLE retail_sales (
    transactions_id INT PRIMARY KEY,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(15),
    age INT,
    category VARCHAR(15),
    quantity INT,
    price_per_unit FLOAT,
    cogs FLOAT,
    total_sale FLOAT
);
```

---

### 2. 📥 Import Data from CSV

```sql
BULK INSERT retail_sales
FROM 'C:\Temp\RetailSales.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);
```

---

### 3. 🧹 Data Cleaning

Check for and delete rows with `NULL` values:

```sql
SELECT * FROM retail_sales
WHERE transactions_id IS NULL
   OR sale_date IS NULL
   OR sale_time IS NULL
   OR customer_id IS NULL
   OR gender IS NULL
   OR age IS NULL
   OR category IS NULL
   OR quantity IS NULL
   OR price_per_unit IS NULL
   OR cogs IS NULL
   OR total_sale IS NULL;

DELETE FROM retail_sales
WHERE transactions_id IS NULL
   OR sale_date IS NULL
   OR sale_time IS NULL
   OR customer_id IS NULL
   OR gender IS NULL
   OR age IS NULL
   OR category IS NULL
   OR quantity IS NULL
   OR price_per_unit IS NULL
   OR cogs IS NULL
   OR total_sale IS NULL;
```

---

### 4. 🔎 Exploratory Data Analysis (EDA)

* **Total sales transactions:**

```sql
SELECT COUNT(*) AS total_sales FROM retail_sales;
```

* **Total number of customers:**

```sql
SELECT COUNT(customer_id) AS total_customers FROM retail_sales;
```

* **Number of unique customers:**

```sql
SELECT COUNT(DISTINCT customer_id) AS unique_customers FROM retail_sales;
```

* **Distinct product categories:**

```sql
SELECT DISTINCT category FROM retail_sales;
```

---

## 📈 Business Questions & Solutions

### Q1. Sales on a specific date

Retrieve all sales made on **2022-12-24**:

```sql
SELECT *
FROM retail_sales
WHERE sale_date = '2022-12-24';
```

✅ **Answer:** 7 sales were made on this date.

---

### Q2. Clothing category sales with quantity ≥ 5 in November 2022

```sql
SELECT *
FROM retail_sales
WHERE category = 'Clothing'
  AND FORMAT(sale_date, 'yyyy-MM') = '2022-11'
  AND quantity >= 5;
```

---

### Q3. Total sales per category

```sql
SELECT 
    category, 
    SUM(total_sale) AS net_sale
FROM retail_sales
GROUP BY category;
```

---

### Q4. Average age of customers who purchased Beauty products

```sql
SELECT 
    ROUND(AVG(age), 2) AS avg_age
FROM retail_sales
WHERE category = 'Beauty';
```

---

### Q5. Total number of transactions by gender and category

```sql
SELECT  
    category, 
    gender, 
    COUNT(*) AS total_trans
FROM retail_sales
GROUP BY category, gender;
```

✅ **Insight:** This helps understand customer segmentation; which gender dominates purchases in each product category.

---

## 📊 Insights

* Total sales transactions: **1987**
* Total customers: **1987**
* Unique customers: **155** (Many customers purchased more than once)
* Product categories: **3** (`Clothing`, `Electronics`, `Beauty`)
* Gender-category breakdown gives deeper insight into customer behavior

---

## 🧠 What I Learned

* How to create and manage databases in SQL Server
* How to import CSV data using `BULK INSERT`
* Best practices for data cleaning with `NULL` checks
* Writing analytical queries to answer real business questions
* Using `FORMAT()` and `YEAR()`/`MONTH()` functions for date-based filtering
* Performing group-by aggregations for category-level insights
* Segmentation analysis based on gender and product category

---

## 🛠️ Tools Used

* 🗄️ **Microsoft SQL Server** – Database & Query Execution
* 📊 **SQL Server Management Studio (SSMS)** – Query Development Environment
* 📁 **CSV Dataset** – Transactional retail sales data

---

## 📌 Future Improvements

* Add visualization layer using Power BI or Python
* Automate data import with SQL Server Agent Jobs
* Create stored procedures for repetitive analysis tasks

---

### 📁 Repository Structure

```
📂 sql_retail_sales_project
│
├─ 📘 README.md                     # Project documentation
├─ 📄 retail_sales.sql              # Main SQL script
└─ 📊 Retail Sales Analysis_utf.csv # Dataset file
```

---

## 🙌 Author

**Yusuf Abdulsobur Olayiwola**
📧 princeolayiwola8@gmail.com

