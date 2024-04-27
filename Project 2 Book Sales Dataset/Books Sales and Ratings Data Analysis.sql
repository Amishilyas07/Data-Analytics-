select *
from 
Books_Data_Clean


---- KPI key performance Indicators--------------

--Total Sales Revenue--

select
SUM(gross_sales) AS total_Sales_Revenue -- 1986586.55179596
from
Books_Data_Clean

--Total Sales Revenue--


--Average Sales Price--

select
AVG(gross_sales) AS Average_Sales_Price  --1856.6229456037
from
Books_Data_Clean

select
SUM(gross_sales)/count(*) AS Average_Sales_Price  --1856.6229456037
from
Books_Data_Clean

--Average Sales Price--


-- Total Units Sold

select
SUM(units_sold) AS total_Units_Sold --10354369
from
Books_Data_Clean

-- Total Units Sold


-- Sales By Publishing Year   -- 2011 Had most Sales and 1987 has Least Sales

select
Publishing_Year,
SUM(gross_sales) AS total_Sales
from
Books_Data_Clean
group by
Publishing_Year
order by SUM(gross_sales) DESC

-- Sales By Publishing Year



------- Cleaned Genre ------------

UPDATE Books_Data_Clean
SET genre = CASE 
WHEN genre = 'genre fiction' THEN  'fiction' 
ELSE genre
END
from
Books_Data_Clean

------- Cleaned Genre ------------


-- Sales By Genre 
SELECT
genre,
SUM(gross_sales) AS Total_Gross_Sales
FROM
Books_Data_Clean
GROUP BY
genre
ORDER BY
Total_Gross_Sales DESC;

-- Sales By Genre 



--- Average Book Rating------
select
(SUM(Book_average_rating)/count(*)) AS Average_Book_Rating --- 4.007
from
Books_Data_Clean

--- Average Book Rating------

SELECT
    Author_Rating,
    COUNT(Author_Rating) AS Count
FROM
    Books_Data_Clean
GROUP BY
    Author_Rating
ORDER BY 
Count(Author_Rating) DESC
--	SELECT
--    Author_Rating,
--    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Books_Data_Clean) AS Percentage
--FROM
--    Books_Data_Clean
--GROUP BY
--    Author_Rating;


-- Average Author Rating---


-- Total Publisher Revenue---

select
SUM(publisher_revenue) AS Total_publisher_revenue  --- 902310.703
from
Books_Data_Clean

-- Total Publisher Revenue---


-- Total Gross Sales By Publisher---

select
 Publisher,
SUM(gross_sales) AS Total_Gross_Sales --- 
from
Books_Data_Clean
group by 
Publisher
ORDER BY SUM(gross_sales) DESC

-- Total Gross Sales By Publisher---


----- Average of Sales Rank------
select
AVG(sales_rank) AS Sales_Rank_Average
from
books_db..Books_Data_Clean

----- Average of Sales Rank------


------ Total Ratings Count----------

select
SUM(Book_ratings_count) AS total_Book_Ratings_Count
from
books_db..Books_Data_Clean


------ Total Ratings Count----------


------ Total Ratings Count----------

select
author,
SUM(Book_ratings_count) AS total_Book_Ratings_Count  --- Stephen King Highest
from
books_db..Books_Data_Clean
GROUP BY Author
ORDER BY SUM(Book_ratings_count) DESC


------ Total Ratings Count----------