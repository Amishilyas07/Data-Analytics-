select
*
from
GameSalesdb

--- KPI's ---

---- Total Games ---

select
COUNT(name) AS Total_Games  -- 16598
from
GameSalesdb

--- Total Platforms --
SELECT
COUNT(DISTINCT platform) AS Total_Platforms
from
GameSalesdb

---No of Publishers--
select
COUNT(DISTINCT publisher) AS 'No of Publishers'
from
GameSalesdb

--- Overall Sales Revenue---

SELECT
SUM(Global_sales) AS Sales_Revenue --- 8920.4399 Million
from
GameSalesdb

----------------------------

----Sales By Genre ----

SELECT                          --- Action Genre is Most Profitable and Strategy is the Least Profitable 
genre,
SUM(Global_sales) AS Sales
from
GameSalesdb
group by genre
ORDER BY SUM(Global_sales) DESC

---- Top 10 Games By Revenue ---

SELECT
TOP 10
name AS 'Game Name', --- Millions 
SUM(Global_sales) AS Revneue
from
GameSalesdb
GROUP BY name
ORDER BY SUM(Global_sales) DESC

---Consoles By Sales Revenue---
SELECT
platform, --- Millions 
SUM(Global_sales) AS Revneue
from
GameSalesdb
GROUP BY platform
ORDER BY SUM(Global_sales) DESC

--- Top 10 Best Publishers---
SELECT
top 10
publisher, --- Millions 
SUM(Global_sales) AS Revneue
from
GameSalesdb
GROUP BY publisher
ORDER BY SUM(Global_sales) DESC

--- Details and Insights --- 
--- TOP 30 game sales in All regions
SELECT
TOP 30
name,
SUM(North_America_sales) AS North_America_Sales,
SUM(Europe_sales) AS Europe_Sales,
SUM(Japan_sales) AS Japan_Sales,
SUM(Other_sales) AS Other_Sales
from 
GameSalesdb
GROUP BY name
ORDER BY SUM(North_America_sales) DESC,
SUM(Europe_sales) DESC,
SUM(Japan_sales) DESC,
SUM(Other_sales) DESC

--- Top 10 Year Sales By Console Type
select
DISTINCT
TOP 10
platform,
SUM(Global_sales) AS Sales,
year
from
GameSalesdb
group by 
platform,
year
ORDER BY SUM(Global_sales) DESC




