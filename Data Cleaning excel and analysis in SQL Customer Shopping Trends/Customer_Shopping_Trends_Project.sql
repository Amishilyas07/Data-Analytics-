
-- Total Revenue Generated ---
--select
--SUM(Purchase_Amount_USD) AS Total_Revenue
--from
--shopping_trends_Updated_Cleaned

-- Total Revenue Generated ---

--- Distribution Across Age Brackets -----
select
distinct
st.Age_Brackets,
count(st.Customer_ID) AS Customer_Distribution
from 
shopping_trends_Updated_Cleaned AS st
group by Age_Brackets
--- Distribution Across Age Brackets -----


--- How does the average purchase amount vary by age bracket and gender?---

select 
st.Age_Brackets,
st.Gender,
AVG(Purchase_Amount_USD) AS Average_Purchase
from
shopping_trends_Updated_Cleaned AS st
GROUP BY 
st.Age_Brackets,
st.Gender
ORDER BY AVG(Purchase_Amount_USD) DESC

--- How does the average purchase amount vary by age bracket and gender?---

--Which items are most frequently purchased by customers?

select
DISTINCT
st.Item_Purchased,
COUNT(st.Item_Purchased) AS Count_Item_Purchased
from shopping_trends_Updated_Cleaned AS st
GROUP BY Item_Purchased 
ORDER BY COUNT(st.Item_Purchased)  DESC

--Which items are most frequently purchased by customers?

--What are the top categories of items purchased by customers?
select
DISTINCT 
st.Category,
COUNT(st.Category) AS Count_Categories_Sold_Most
from
shopping_trends_Updated_Cleaned AS st
GROUP BY 
st.Category
ORDER BY COUNT(st.Category) DESC
--What are the top categories of items purchased by customers?

--How does the average purchase amount vary by category?

select
DISTINCT 
st.Category,
AVG(st.Purchase_Amount_USD) AS Avg_Purchase_By_Category
from
shopping_trends_Updated_Cleaned AS st
GROUP BY 
st.Category
ORDER BY AVG(st.Purchase_Amount_USD) DESC

--How does the average purchase amount vary by category?



-- What is the distribution of purchases by location?

select
st.Location,
SUM(st.Purchase_Amount_USD) AS Purchase_Distribution_By_Location
from
shopping_trends_Updated_Cleaned AS st
GROUP BY 
st.Location
ORDER BY SUM(st.Purchase_Amount_USD) DESC

-- What is the distribution of purchases by location?


-- Which sizes and colors are most popular among customers?
SELECT 
  st.Size,
    st.Color,
    COUNT(DISTINCT st.Customer_ID) AS Customers
FROM
    shopping_trends_Updated_Cleaned AS st
GROUP BY 
    st.Size,
    st.Color
ORDER BY 
 COUNT(DISTINCT st.Customer_ID) DESC;
 
-- Which sizes and colors are most popular among customers?

--What is the distribution of purchases by season?

select
st.Season AS Season,
SUM(st.Purchase_Amount_USD) AS Season_Sales_Distribution
from 
shopping_trends_Updated_Cleaned AS st
group by st.Season
order by 
SUM(st.Purchase_Amount_USD) DESC

--What is the distribution of purchases by season?

--How does the average purchase amount vary by season?
select
st.Season AS Season,
AVG(st.Purchase_Amount_USD) AS Average_Sales
from 
shopping_trends_Updated_Cleaned AS st
group by st.Season
order by 
SUM(st.Purchase_Amount_USD) DESC

--How does the average purchase amount vary by season?


--What is the distribution of review ratings given by customers?

select
st.Review_Rating,
COUNT(DISTINCT st.Customer_ID) AS Rating_Count
from
shopping_trends_Updated_Cleaned AS st
GROUP BY 
st.Review_Rating
ORDER BY COUNT(DISTINCT st.Customer_ID) DESC

--What is the distribution of review ratings given by customers?

-- How does the average purchase amount vary by review rating?
select
AVG(st.Purchase_Amount_USD) AS Average_Sales,
st.Review_Rating
from
shopping_trends_Updated_Cleaned AS st
GROUP BY st.Review_Rating
ORDER BY AVG(st.Purchase_Amount_USD) DESC
-- How does the average purchase amount vary by review rating?

--What percentage of customers have a subscription status?

SELECT
    (COUNT(CASE WHEN Subscription_Status = 'Yes' THEN 1 END) * 100.0) / 
	COUNT(*) AS Subscription_Percentage
FROM
    shopping_trends_Updated_Cleaned;

--What percentage of customers have a subscription status?

-- How does the average purchase amount vary between subscribed
--and non-subscribed customers?

SELECT
    Subscription_Status,
    AVG(st.Purchase_Amount_USD) AS AvgPurchaseAmount
FROM
    shopping_trends_Updated_Cleaned AS st
GROUP BY
    Subscription_Status
	ORDER BY AVG(st.Purchase_Amount_USD) DESC

	-- How does the average purchase amount vary between subscribed
--and non-subscribed customers?


-- What are the most commonly used shipping types?
select
DISTINCT
st.Shipping_Type
from
shopping_trends_Updated_Cleaned AS st
-- What are the most commonly used shipping types?

-- How does the average purchase amount vary by shipping type?
select
st.Shipping_Type,
AVG(st.Purchase_Amount_USD) AS Average_Purchase
from
shopping_trends_Updated_Cleaned AS st
GROUP BY st.Shipping_Type
ORDER BY AVG(st.Purchase_Amount_USD) DESC
-- How does the average purchase amount vary by shipping type?

--How many customers used a discount or promo code?

SELECT
COUNT(CASE WHEN st.Promo_Code_Used= 'YES' THEN 1 END) AS Promo_Code_Used,
COUNT(CASE WHEN st.Discount_Applied = 'Yes' THEN 1 END) AS Discount_Applied
from 
shopping_trends_Updated_Cleaned AS st

--How many customers used a discount or promo code?


-- How does the average purchase amount vary between customers 
--who used a discount/promo code and those who didn't?

SELECT
st.Discount_Applied,
AVG(st.Purchase_Amount_USD) AS Average_Purchase
from 
shopping_trends_Updated_Cleaned AS st
GROUP BY st.Discount_Applied


-- How does the average purchase amount vary between customers 
--who used a discount/promo code and those who didn't?


-- How many previous purchases do customers typically have?

select
DISTINCT 
SUM(st.Previous_Purchases) AS Previous_Purchases_Total
from shopping_trends_Updated_Cleaned AS st

-- How many previous purchases do customers typically have?


--How does the average purchase amount vary by the number of previous purchases?

SELECT
    Previous_Purchases,
    AVG(st.Purchase_Amount_USD) AS Average_Purchase
FROM
    shopping_trends_Updated_Cleaned AS st
GROUP BY
    Previous_Purchases
	ORDER BY  AVG(st.Purchase_Amount_USD) DESC

--How does the average purchase amount vary by the number of previous purchases?


-- What are the most common payment methods used?
select
DISTINCT 
st.Payment_Method
from 
shopping_trends_Updated_Cleaned AS st

-- What are the most common payment methods used?


-- How does the average purchase amount vary by payment method?

select
AVG(st.Purchase_Amount_USD) AS Average_Purchase_Price,
st.Payment_Method
from 
shopping_trends_Updated_Cleaned AS st
GROUP BY st.Payment_Method
ORDER BY AVG(st.Purchase_Amount_USD) DESC

-- How does the average purchase amount vary by payment method?


--How often do customers make purchases?

select
st.Frequency_of_Purchases,
COUNT(Frequency_of_Purchases) AS Purchases
from 
shopping_trends_Updated_Cleaned AS st
GROUP BY 
st.Frequency_of_Purchases
ORDER BY COUNT(Frequency_of_Purchases) DESC

--How often do customers make purchases?

--How does the average purchase amount vary by frequency of purchases?

select
AVG(st.Purchase_Amount_USD) Average_Purchase,
st.Frequency_of_Purchases
from
shopping_trends_Updated_Cleaned AS st
GROUP BY Frequency_of_Purchases 
ORDER BY AVG(st.Purchase_Amount_USD) DESC

--How does the average purchase amount vary by frequency of purchases?

--- Customers by Gender and Location
select
COUNT(*) AS counting,
st.Gender,
st.Location
from 
shopping_trends_Updated_Cleaned AS st
group by 
st.Gender,
st.Location
ORDER BY Location ASC 
--- Customers by Gender and Location

