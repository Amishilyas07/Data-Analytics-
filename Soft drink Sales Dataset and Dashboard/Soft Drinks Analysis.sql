select
*
from
soft_drink_sales

-- Change Revenue Profit into Decimal In Tableau---
--- Perform Correlation Analysis in Tableau---

-- Overview Tab---
-------KPIs---------

--- Total Revenue---

select
SUM(Revenue) AS Total_Revenue
from
soft_drink_sales


--Total Orders--
select
COUNT(Order_ID) AS Total_Orders
from
soft_drink_sales

--Total Units Sold--
select
SUM(Units_Sold) AS Total_Units_Sold
from
soft_drink_sales

--- Total Revenue---

select
SUM(Revenue) AS Total_Revenue
from
soft_drink_sales

--- Total Profit---

select
SUM(Profit) AS Total_Profit
from
soft_drink_sales


--- Sales Trend Over Time ---
select
CASE
WHEN
MONTH(Purchase_Date) = 1 THEN 'January' 
WHEN MONTH(Purchase_Date) = 2 THEN 'Feburary'
WHEN
MONTH(Purchase_Date) = 3 THEN 'March'
WHEN
MONTH(Purchase_Date) = 4 THEN 'April'
WHEN
MONTH(Purchase_Date) = 5 THEN 'May'
WHEN
MONTH(Purchase_Date) = 6 THEN 'June'
WHEN
MONTH(Purchase_Date) = 7 THEN 'July'
WHEN
MONTH(Purchase_Date) = 8 THEN 'August'
WHEN
MONTH(Purchase_Date) = 9 THEN 'September'
WHEN
MONTH(Purchase_Date) = 10 THEN 'October'
WHEN
MONTH(Purchase_Date) = 11 THEN 'November'
WHEN
MONTH(Purchase_Date) = 12 THEN 'December'
ELSE 'Error' 
END AS Month_Of_Sales,
SUM(Revenue) AS Revenue
from
soft_drink_sales
group by 
MONTH(Purchase_Date)
order by SUM(Revenue) DESC

--- Yearly Sales---
select
YEAR(Purchase_Date) AS Year_Of_Sale,
SUM(Units_Sold) AS Sales
from
soft_drink_sales
group by 
Year(Purchase_Date)
order by SUM(Units_Sold) DESC



--- Top Revenue Generating Products--

select
Product,
SUM(Revenue) AS Revenue
from
soft_drink_sales
group by Product
ORDER BY SUM(Revenue) DESC

--- Company with most Sales--

select
Company,
SUM(Revenue) AS Sales
from
soft_drink_sales
group by Company
ORDER BY SUM(Revenue) DESC

--- Company with most Selling Products--

select
Company,
Product,
SUM(Revenue) AS Sales
from
soft_drink_sales
group by Company,Product
ORDER BY Company ASC, SUM(Revenue) DESC

------------------ Sales Analysis Tab-----------------------------------------------------------------------------

-- Sales By Product--
select
product,
SUM(Revenue) AS Revenue
from
soft_drink_sales
group by Product
order by SUM(Revenue) DESC 

-- Sales By Category--
select
Category,
SUM(Revenue) AS Sales
from
soft_drink_sales
group by Category
order by SUM(Revenue) DESC 

-- Profit By Product and Category--
select
Product,
Category,
SUM(Profit) AS Sales
from
soft_drink_sales
group by Category,Product
order by SUM(Units_Sold) DESC 

--Profit margin By Product And Category--
SELECT
    Product,
    Category,
    SUM(CAST(Revenue AS DECIMAL(10, 2))) AS Total_Revenue,
    SUM(CAST(Profit AS DECIMAL(10, 2))) AS Total_Profit,
    (SUM(CAST(Profit AS DECIMAL(10, 2))) / NULLIF(SUM(CAST(Revenue AS DECIMAL(10, 2))), 0)) * 100 AS Profit_Margin_Percentage
FROM
    soft_drink_sales
GROUP BY
    Product, Category
ORDER BY
    Profit_Margin_Percentage DESC;


--- Customer Insights Tab-----------------------------------------------------------------------------------------

--- Customer Distribution By State--
select
Customer_State,
COUNT(*) AS Customers_Count
from
soft_drink_sales
group by Customer_State
order by COUNT(*) DESC


--- Sales By State---
select
Customer_State,
SUM(Revenue) AS Sales_By_State
from
soft_drink_sales
group by Customer_State
order by SUM(Revenue) DESC

--- Sales By City---
select
Customer_City,
SUM(Revenue) AS Sales_By_City
from
soft_drink_sales
group by Customer_City
order by SUM(Revenue) DESC



