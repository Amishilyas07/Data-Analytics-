select 
*
from 
pizza_sales


--- KPI ---


-- Total Revenue 


select
SUM(total_price) AS total_Revenue   -- 817860.05
from
pizza_sales

--- Avg Order value

select
AVG(total_price) AS average_order_Value -- 16.82147
from
pizza_sales

-- Total Number Of Orders

select 
DISTINCT
COUNT(order_id) AS Total_Orders  -- 48620
from
pizza_sales

-- Avg quantity per order

SELECT
AVG(DISTINCT quantity) AS Average_Quantity_Per_Order -- 2
from
pizza_sales


--- Profit Margin

SELECT
    ((SUM(total_price) - SUM(unit_price)) / SUM(total_price)) AS Profit_Margin
FROM
    pizza_sales;


--- KPI ---

select
pizza_size,
COUNT(*) AS Top_5_Pizza_By_Size
from
pizza_sales
GROUP BY 
pizza_size
ORDER BY COUNT(*) DESC

-- Popular Pizza Categories 
select
pizza_category,
COUNT(*) AS Top_Selling_Pizza_Categories
from
pizza_sales
group by pizza_category
ORDER BY COUNT(*) DESC

--- Sales Trend By Time 
SELECT
DATEPART(HOUR, order_time) AS Hours,
ROUND(COUNT(order_id), 2) AS Sales_By_Time 
from
pizza_sales
GROUP BY
DATEPART(HOUR, order_time)
ORDER BY
DATEPART(HOUR, order_time) ASC 


---Based on the provided data, the peak order times appear to be:

--12 PM (noon) with 6543 orders
--1 PM with 6203 orders
--6 PM with 5359 orders
--5 PM with 5143 orders


--- Sales Trend By Day 

SELECT
DISTINCT
    DATEPART(WEEKDAY, order_date) AS WeekDay,
    COUNT(order_id) AS Sales_By_Week_Day
FROM
    pizza_sales
	WHERE 
	    DATEPART(WEEKDAY, order_date) IS NOT NULL
GROUP BY
    DATEPART(WEEKDAY, order_date)
ORDER BY
    COUNT(order_id) DESC;



-- Top 5 Popular Pizza By Name

select
TOP 5
pizza_name,
COUNT(pizza_name_id) AS Sales_By_Name
from
pizza_sales
GROUP BY pizza_name
ORDER BY COUNT(pizza_name_id) DESC