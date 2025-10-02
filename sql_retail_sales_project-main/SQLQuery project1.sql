-- SQL Retail Sales Analysis -P1
 CREATE DATABASE sql_project_p1;
 -- Create TABLE
DROP TABLE IF EXISTS retail_sales;
 CREATE TABLE retail_sales
 (
 transactions_id INT PRIMARY KEY,
 sale_date	DATE,
 sale_time	TIME,
 customer_id	INT,
 gender	       VARCHAR(15),
 age        INT,
 category	VARCHAR(15),
 quantity	INT,
 price_per_unit  FLOAT,
 cogs	FLOAT,
 total_sale  FLOAT
 );

 SELECT * FROM retail_sales;
 BULK INSERT retail_sales
FROM 'C:\Users\user\Desktop\Retail Sales Analysis_utf.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,             -- skip the header row
    FIELDTERMINATOR = ',',    -- columns separated by comma
    ROWTERMINATOR = '\n',     -- new row on new line
  TABLOCK
);

 
SELECT
      COUNT(*)
FROM retail_sales;

---- DATE CLEANING
 
SELECT * FROM retail_sales
WHERE 
transactions_id IS NULL
OR
sale_date IS NULL
OR
sale_time IS NULL
OR
customer_id IS NULL
OR
gender IS NULL
OR
age IS NULL
OR
category IS NULL
OR
quantity IS NULL
OR
price_per_unit IS NULL
OR
cogs IS NULL
OR
total_sale IS NULL

--- 
DELETE FROM retail_sales
WHERE 
transactions_id IS NULL
OR
sale_date IS NULL
OR
sale_time IS NULL
OR
customer_id IS NULL
OR
gender IS NULL
OR
age IS NULL
OR
category IS NULL
OR
quantity IS NULL
OR
price_per_unit IS NULL
OR
cogs IS NULL
OR
total_sale IS NULL

 
SELECT * FROM retail_sales


--- DATA EXPLORATION (EDA)

--- How many sales we have? We have 1987 sales

SELECT COUNT (*) as total_sale FROM retail_sales

--- How many customers do we have?  We have 1987 Customers. This show that we have some customers that have brought goods >1 time.

SELECT COUNT (customer_id) as Number_of_ustomer FROM retail_sales

--- How many  unique  customers do we have?  We have 155 unique Customers.

SELECT COUNT (DISTINCT customer_id) as Number_of_unique_ustomer FROM retail_sales

--- How many Categories do we have? We have 3 categories (Beauty, Electronics, Clothing)
SELECT DISTINCT category FROM retail_sales

--- DATA ANALYSIS & BUSINESS PROBLEM AND ANSWER:

-- Q.1: Write a SQL query to retrieve all columns for sales made on '2022-12-24'
SELECT *
FROM retail_sales
WHERE sale_date = '2022-12-24';

--- Answer.1: We have 7 sales on '2022-12-24'

--- Q.2: Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more then 5 in the month of Nov-2022
SELECT
*
FROM retail_sales
WHERE category = 'Clothing'
   AND 
  FORMAT(sale_date,  'YYYY-MM') = '2022-11'
  AND
  quantity <= 5

  ---Q.3: Write a SQL query to calculate the total sales (total_sale) for each category.
  SELECT
   category,
   SUM(total_sale) as net_sale
   FROM retail_sales
   GROUP BY category;

   ---Q.4: Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category
   SELECT
   ROUND(AVG(age), 2) as avg_age
   FROM retail_sales
   WHERE category ='Beauty'

  --- Q.5: Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category
  SELECT 
   category,
   gender,
   COUNT(*) as total_trans
   FROM retail_sales
   GROUP BY category, gender







