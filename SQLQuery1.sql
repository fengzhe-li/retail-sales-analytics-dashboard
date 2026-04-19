-- KPI Summary
SELECT 
COUNT(*) AS total_orders,
SUM(sales) AS total_revenue,
SUM(profit) AS total_profit,
SUM(quantity) AS total_units
FROM dbo.retail_sales_dataset;
-- Regional Performance
SELECT 
region,
COUNT(*) AS orders,
SUM(sales) AS revenue,
SUM(profit) AS profit
FROM dbo.retail_sales_dataset
GROUP BY region
ORDER BY revenue DESC;
-- Product Performance
SELECT 
product,
SUM(quantity) AS units_sold,
SUM(sales) AS revenue,
SUM(profit) AS profit
FROM dbo.retail_sales_dataset
GROUP BY product
ORDER BY revenue DESC;
-- Monthly Sales Trend
SELECT 
MONTH(order_date) AS month_num,
COUNT(*) AS orders,
SUM(sales) AS revenue,
SUM(profit) AS profit
FROM dbo.retail_sales_dataset
GROUP BY MONTH(order_date)
ORDER BY month_num;
-- Product Margin Analysis
SELECT
product,
SUM(sales) AS revenue,
SUM(profit) AS profit,
ROUND(SUM(profit)*100.0/SUM(sales),2) AS margin_pct
FROM dbo.retail_sales_dataset
GROUP BY product
ORDER BY margin_pct DESC;
-- Average Order Value
SELECT
SUM(sales)/COUNT(*) AS avg_order_value,
SUM(quantity)*1.0/COUNT(*) AS avg_units_per_order
FROM dbo.retail_sales_dataset;