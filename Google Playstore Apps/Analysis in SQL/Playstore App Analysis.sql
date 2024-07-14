select
*
from
PlaystoreApps

--- KPI's -- 

----Total Apps----  9636
select
COUNT(Distinct App) AS Total_Apps
from
PlaystoreApps

-- Total App Genres--  48
select
COUNT(Distinct Genres) AS Total_App_Genres
from
PlaystoreApps

-- Total Ratings--  39
select
Count(Rating) AS Total_Ratings
from
PlaystoreApps

-- Total Reviews-- 4814617393
select
SUM(Reviews) AS Total_Reviews
from
PlaystoreApps

-- Total Installs-- 167633433487
select
SUM(Installs) AS Total_Installs
from
PlaystoreApps


--- Overview Tab----

-- Apps And Genres By Typee

select 
COUNT(DISTINCT App) AS App,
COUNT(DISTINCT Genres) AS Genres,
Type
from
PlaystoreApps
GROUP BY
Type

-- Apps And Genres By Content Rating

select
COUNT(DISTINCT App) AS App,
COUNT(DISTINCT Genres) AS Genres,
[Content Rating]
from
PlaystoreApps
GROUP BY
[Content Rating]

-- Apps And Genres By Android Ver

select
COUNT(DISTINCT App) AS App,
COUNT(DISTINCT Genres) AS Genres,
[Android Ver]
from
PlaystoreApps
GROUP BY
[Android Ver]




















-- Apps Tab

--- Top 10 Apps By Reviews--
Select
Distinct
top 10
App,
SUM(Reviews) AS Reviews
from
PlaystoreApps
GROUP BY App
Order by Reviews DESC

--- Apps By Ratings--
Select
Distinct
Rating,
COUNT(App) AS Apps
from 
PlaystoreApps
group by Rating
Order By Apps DESC

--- Top 10 Apps By 5 star Ratings--
Select
top 10
App,
Rating
from 
PlaystoreApps
Order By Rating DESC

--- Top 30 Most Installed--
Select
Distinct
top 30
App,
Installs
from 
PlaystoreApps
Order By Installs Desc

--- Top 20 Most Installed Apps --
Select
Distinct
COUNT(App) Apps,
Installs
from 
PlaystoreApps
group by Installs
order by Installs DESC



-- Genres Tab


---- Genres By Ratings >4.5
select
Genres,
COUNT(Rating) AS Rating
from
PlaystoreApps
WHERE
Rating > 4.5
group by
Genres
ORDER BY Rating DESC

---- Genres By Reviews
select
Genres,
SUM(Reviews) AS Reviews
from
PlaystoreApps
group by
Genres
ORDER BY Reviews DESC
---- Genres By Installs
select
Genres,
SUM(Installs) AS Installs
from
PlaystoreApps
group by
Genres
ORDER BY Installs DESC

---- Genres By Installs
select
Genres,
Type,
Count(Type) AS TypeCount
from
PlaystoreApps
group by
Genres,
Type
ORDER BY TypeCount DESC

---- Genres By Installs
select
Genres,
[Content Rating],
Count([Content Rating]) AS ContentRating_Count
from
PlaystoreApps
group by
Genres,
[Content Rating]
ORDER BY ContentRating_Count DESC