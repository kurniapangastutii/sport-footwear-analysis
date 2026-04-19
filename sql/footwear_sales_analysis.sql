---how many our data
SELECT COUNT(*)
FROM footwear_SALES;

---checking data type
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'footwear_sales';

---Changing data type to numeric
ALTER TABLE footwear_sales
ALTER COLUMN customer_rating TYPE NUMERIC,
ALTER COLUMN final_price_usd TYPE NUMERIC,
ALTER COLUMN revenue_usd TYPE NUMERIC;

---filter data only until 2025
CREATE TABLE sales_2018_2025 AS 
SELECT *
FROM footwear_sales
WHERE order_date < '2026-01-01';

SELECT MAX(order_date)
FROM sales_2018_2025;

---Calculate total_revenue, units_sold, orders, & average price

SELECT 
ROUND(SUM(revenue_usd),2) AS total_revenue,
ROUND(SUM(units_sold),2) AS total_units_sold,
ROUND(COUNT(order_id)::NUMERIC,2) AS total_orders,
ROUND(AVG(final_price_usd),2) AS average_price
FROM sales_2018_2025;

---Calculate Revenue by Year, YoY% Revenue
---aggregate revenue per year
CREATE TABLE year_revenue AS
SELECT
DATE_PART('year', order_date) AS year,
SUM(revenue_usd) AS revenue
FROM sales_2018_2025
GROUP BY year;

CREATE TABLE YoY AS
SELECT
year,
revenue,
LAG(revenue) OVER (ORDER BY year) AS prev_revenue,
ROUND((((revenue-LAG(revenue) OVER (ORDER BY year))/
LAG(revenue) OVER(ORDER BY year))*100),2) AS YoY
FROM year_revenue;
ORDER BY year;

SELECT *
FROM YoY;

---Calculate brand revenue
SELECT
brand,
SUM(revenue_usd) AS revenue
FROM sales_2018_2025
GROUP BY brand
ORDER BY revenue DESC;

---Calculate units_sold by categories shoe
SELECT
category,
SUM(units_sold) AS total_units_sold
FROM sales_2018_2025
GROUP BY category
ORDER BY total_units_sold;

---% Discount VS units_sold
SELECT
discount_percent,
SUM(units_sold) AS total_units_sold
FROM sales_2018_2025
GROUP BY discount_percent
ORDER BY total_units_sold;

---Units_sold VS sales channel
SELECT sales_channel,
SUM(units_sold) AS total_units_sold
FROM sales_2018_2025
GROUP BY sales_channel
ORDER BY total_units_sold;

---total revenue, orders, units sold by country
SELECT country,
SUM(revenue_usd) AS revenue,
COUNT(order_id) AS total_orders,
SUM(units_sold) AS total_units_sold
FROM sales_2018_2025
GROUP BY country
ORDER BY revenue, total_orders, total_units_sold;
