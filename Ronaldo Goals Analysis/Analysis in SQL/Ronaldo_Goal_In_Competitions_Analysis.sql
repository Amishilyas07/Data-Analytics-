select 
*
from
Ronaldo

----KPI's---

---Total Goals Scored
Select
Count(Season) AS Total_Goals_Scored_By_Ronaldo
from
Ronaldo
---Total Competitions 
Select
Count(Distinct Competition) AS Total_Competitions
from
Ronaldo


---Total Matches Played -- 468
Select
Count(Distinct Date) AS Total_Matches_Played_By_Ronaldo
from
Ronaldo

---Goals By Seasons-- 
Select
Season,
Count(Distinct Date) AS Goals_Scored
from
Ronaldo
Group By Season
Order by Season

---Goals By Venue-- 
Select
Venue,
Count(Distinct Date) AS Goals_By_Venue
from
Ronaldo
Group By Venue
Order by Venue

--------------------------------

--- More Goals By Playing Position--
Select
Playing_Position,
Count(Distinct Date) AS Goals_By_Playing_Position
from
Ronaldo
Group By Playing_Position
Order by Playing_Position

--- Most Goals Scored Against which Opponent--
Select
top 5
Opponent,
Count(Distinct Date) AS Goals_Against_Opponent
from
Ronaldo
Group By Opponent
Order by Goals_Against_Opponent DESC

--- Most Goals Scored In Which Competition--
Select
Competition,
Count(Distinct Date) AS Goals_In_Competition
from
Ronaldo
Group By Competition
Order by Goals_In_Competition DESC

--- Most Goals Scored In Which Club--
Select
Club,
Count(Distinct Date) AS Goals_In_Club
from
Ronaldo
Group By Club
Order by Goals_In_Club DESC

--- Most Goals Scored In Which Time (Min)--
Select
[Ronaldo_Playing_Position(min)],
Count(Distinct Date) AS Goals_In_Time
from
Ronaldo
Group By [Ronaldo_Playing_Position(min)]
Order by Goals_In_Time DESC