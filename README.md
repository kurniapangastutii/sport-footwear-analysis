# 💰 Sport Footwear Sales Performance Analysis

📌 Overview

This project presents an interactive Power BI dashboard to analyze the sales performance of a multi-brand footwear company across countries, sales channels, and discount strategies. 

The dashboard provides a comprehensive view of key business metrics, including total revenue, units sold, average price, and year-over-year (YoY) growth. It is designed to help stakeholders quickly understand performance trends, identify key revenue drivers, and support data-driven decision-making.
---

##🎯 Business Problems
The company is experiencing inconsistent sales performance over time, and it is unclear which factors are driving or limiting revenue growth. 

Key questions include:
What is causing fluctuations in revenue trends?
Which brands contribute the most to overall performance?
Does offering discounts effectively increase sales volume?
Which sales channels and markets should be prioritized?

Without clear insights, the company may struggle to optimize its strategy and achieve sustainable growth.

##📂 Data Overview
Source: Sports Footwear Sales & Consumer Behavior (Kaggle)
Period: 2018-2025
Scope: 26k+ orders, 6 brands, 5 categories of shoes, and 6 countries
Key columns:
order_id
order_date
brand
category
final_price_usd
units_sold
revenue_usd
discount_percent
sales_channel
country

##🛠 Tools & Technologies
Kaggle → Data source (.csv)
Power Query → Data Cleaning + Data Preparation  
Data Modeling → Data Preparation  
DAX → Data Preparation + EDA  
Power BI Visual → Data Visualization 

##🔎 Project Workflow
🧹Data Cleaning and Preparation
Converting data type (e.g., date, numeric field)

🧩Data Preparation and Modelling
Creating additional columns such as Year and Month
Building a Date table using DAX to enable time-based analysis
Establishing relationships between tables (data modeling)
Creating foundational measures (e.g., Total Revenue, Total Units Sold)

🧠Data Calculation (DAX)
Year-over-Year (YoY) and Month-over-Month (MoM) Growth
Discount bucket segmentation

🔎Exploratory Data Analysis (EDA)
Revenue trends over time
Brand performance comparison
Impact of discount on sales
Sales channel distribution
Geographic performance
Impact of different payment methods and sales channel


##📈 Dashboard (Power BI Section)
The interactive dashboard was developed using Power BI to provide a comprehensive overview of sales performance and key business drivers.
