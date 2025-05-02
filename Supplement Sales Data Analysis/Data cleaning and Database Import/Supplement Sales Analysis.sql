############################### Analysis Supplement Sales 2020 - 2025 ####################

-- select
-- *
-- from
-- supplement_sales_data_transformed



###################################### Overall Business Perfomance ##############################
-- Create View Business_Performance as 
-- select
-- 'Total Net Revenue'  as Measure,
--  round(sum(Net_Revenue),2) as Value
-- from
-- supplement_sales_data_transformed

-- union

-- select
-- 'Average Unit Price'  as Measure,
--  round(AVG(Price),2) as Value
-- from
-- supplement_sales_data_transformed

-- union

-- select
-- 'Total Units Sold'  as Measure,
--  SUM(`Units Sold`) as Value
-- from
-- supplement_sales_data_transformed

-- union

-- select
-- 'Average Discount Rate'  as Measure,
-- Concat(round( avg(Discount) *100,2),' ','%') as Value
-- from
-- supplement_sales_data_transformed


-- union

-- select
-- 'Total Units Returned'  as Measure,
--  SUM(`Units Returned`) as Value
-- from
-- supplement_sales_data_transformed


-- union

-- select
-- 'Return Rate'  as Measure,
--  CONCAT(ROUND(SUM(`Units Returned`)/sum(`Units Sold`) *100,2),' ','%') as Value
-- from
-- supplement_sales_data_transformed



-- union

-- select
-- 'Revenue Per Units Sold'  as Measure,
-- ROUND( sum(Net_Revenue)/sum(`Units Sold`),2 ) as Value
-- from
-- supplement_sales_data_transformed

###################################### Overall Business Perfomance ##############################

################################################# Data is Okay with No Outliers  #############################################

-- select
-- MIN(Price),
-- MAX(Price),
-- AVG(Price),

-- MIN(`Units Sold`),
-- MAX(`Units Sold`),
-- AVG(`Units Sold`),

-- MIN(`Discount`),
-- MAX(`Discount`),
-- AVG(`Discount`),

-- MIN(`Units Returned`),
-- MAX(`Units Returned`),
-- AVG(`Units Returned`)

-- from
-- supplement_sales_data_transformed

################################################# Data is Okay with No Outliers  #############################################



####################################################################### Monthly Overall Business Performance ###########################################################

-- create view Monthly_performance_overall as 
-- WITH CTE AS (select
-- `month`,
-- COUNT(date) as Total_Orders,
-- ROUND(SUM(Net_Revenue),2) as Total_Revenue,
-- SUM(`Units Sold`) as Total_Units_Sold,
-- CONCAT(ROUND(AVG(Discount) *100,2),' ' , '%') as Average_Discount_Rate,
-- ROUND((sum(`Units Returned`) / sum(`Units Sold`)) *100,2) as Return_Rate,
-- ROUND(avg(price),2) as Average_Price
-- from
-- supplement_sales_data_transformed
-- group by `month`
-- )
-- ,
-- Prev_Mon as (select
-- *,
-- lag(Total_Revenue,1,0) over(order by month) as previous_month_Revenue
-- from 
-- CTE
-- )

-- ,
-- Monthly_performance as (select
-- *,
-- CONCAT(Round((Total_Revenue-previous_month_Revenue) / previous_month_Revenue *100,2),' ' , '%') as Growth_Rate
-- from
-- Prev_Mon
-- )

-- select
-- `month`,
-- Total_orders,
-- Total_Revenue,
-- Total_Units_Sold,
-- Average_Discount_Rate,
-- IFNULL(Growth_Rate,0) as Growth_Rate,
-- Return_Rate,
-- Average_Price
-- from
-- Monthly_performance


-- select
-- *
-- from
-- Monthly_performance_overall
####################################################################### Monthly Overall Business Performance ###########################################################



####################################################################### Yearly Overall Business Performance ###########################################################
-- create view yearly_business_performance_view as 
-- WITH Rev as (
-- select 
-- `Year`,
-- COUNT(*) as Total_Orders,
-- round(SUM(Net_Revenue),2) as Total_Revenue,
-- ROUND(AVG(Discount) *100,2) as Discount_Percentage,
--  sum(`Units Returned`)/sum(`Units Sold`)*100 as Return_Rate,
--  round(avg(price),2) as Average_Price
-- from 
-- supplement_sales_data_transformed
-- group by `Year`
-- ) 
-- ,

-- Prev_Rev as (select
-- *,
-- lag(Total_Revenue) over(order by `Year`) as Previous_Month_Revenue
-- from 
-- Rev
-- )

-- select
-- `Year`,
-- Total_Orders,
-- Total_Revenue,
-- CONCAT(round((Total_Revenue-Previous_Month_Revenue)/Previous_Month_Revenue *100,2),' ','%') as Growth_Percentage,
-- CONCAT(Discount_Percentage,' ','%') as Discount_Rate,
-- CONCAT(Return_Rate,' ','%') as Return_Rate,
-- Average_Price
-- from
-- Prev_Rev

-- select 
-- *
-- from
-- yearly_business_performance_view


####################################################################### Yearly Overall Business Performance ###########################################################





##################################################################### Product and Category Analysis #########################################################################

############################ Revenue  Orders and Return Rate by Category ##################################
-- create view Category_Overall_Performance_view as 
-- select
-- Category,
-- COUNT(*) as Total_Orders, 
-- ROUND(SUM(Net_Revenue),2) as Total_Revenue,
-- ROUND(sum(`Units Returned`)/sum(`Units Sold`)*100,2) as Return_Rate

-- from 
-- supplement_sales_data_transformed
-- group by Category 
-- order by ROUND(SUM(Net_Revenue),2) desc

-- select
-- *
-- from
-- category_overall_performance_view


######################## Revenue Orders and Return Rate By Category #####################
-- create view products_overall_performance_view as 
-- select
-- `Product Name`,
-- COUNT(*) as Total_Orders, 
-- ROUND(SUM(Net_Revenue),2) as Total_Revenue,
-- ROUND(sum(`Units Returned`)/sum(`Units Sold`)*100,2) as Return_Rate

-- from 
-- supplement_sales_data_transformed
-- group by `Product Name`
-- order by ROUND(SUM(Net_Revenue),2) desc

######################## Revenue Orders and Return Rate By Category #####################

##################################################################### Product and Category Analysis #########################################################################



##################################################################### Platform Analysis ####################################################################################

########################################### Platform Overall Performance ###############################

-- create view platform_overall_performance_view as 
-- WITH Total_Rev as (
-- select
-- sum(Net_Revenue) as Total_Revenue_All
-- from 
-- supplement_sales_data_transformed
-- )
-- ,
-- CTE AS (
-- select
-- Platform ,
-- COUNT(*) as Total_Orders,
-- sum(`Units Sold`) as Total_Units_Sold,
-- ROUND(sum(Net_Revenue),2) as Total_Revenue
-- from 
-- supplement_sales_data_transformed
-- group by 
-- platform
-- )
-- ,
--  
-- REV_CALC as ( select
-- *,
-- (Select Total_Revenue_All from Total_Rev) as Total_Revenue_all
-- from CTE
-- )

-- select
-- Platform,
-- Total_Orders,
-- Total_Units_Sold,
-- Total_Revenue,
-- CONCAT(round((Total_Revenue/Total_Revenue_all)*100,2),' ','%') as Revenue_Percentage
-- from
-- REV_CALC
-- order by Total_Revenue desc

########################################### Platform Overall Performance ###############################

############################## Return Behaviour By Platform and it's Financial Impact #######################

-- create view Return_behaviour_and_financial_impact_by_Platform_view as 
-- select 
-- Platform,
-- count(*) as Total_orders,
-- ROUND(sum(Net_Revenue),2) as Total_Revenue,
-- CONCAT(ROUND(AVG(discount) *100,2),' ','%') as Discount_Rate,
-- CONCAT(Round(sum(`Units Returned`)/sum(`Units Sold`)*100,2),' ','%') as Return_Rate,
-- CONCAT(ROUND(AVG(price),2),' ','%') as Average_Price
-- from
-- supplement_sales_data_transformed
-- group by platform 
-- order by Round(sum(`Units Returned`)/sum(`Units Sold`)*100,2) desc



############################## Return Behaviour By Platform and it's Financial Impact #######################


###############################  Revenue and Orders by Location #############################
-- create view Revenue_Orders_By_Location_view as 
-- select
-- location,
-- COUNT(*) as Total_Orders,
-- ROUND(SUM(Net_Revenue),2) as Total_Revenue
-- from
-- supplement_sales_data_transformed
-- group by location 

-- select
-- *
-- from
-- revenue_orders_by_location_view
###############################  Revenue and Orders by Location #############################


############################## Location With Higher Return and Lower Margins ###########################

-- create view Location_Return_Lower_margin_view as 
-- select
-- Location,
-- COUNT(*) as Total_Orders,
-- ROUND(sum(Net_Revenue),2) as Total_Revenue,
-- CONCAT(ROUND(AVG(Discount)*100,2),' ','%') as Discount_Rate,
--  ROUND(AVG(price),2)as Average_Price,
--  CONCAT(round(sum(`Units Returned`)/sum(`Units Sold`)*100,2),' ','%') as Return_Rate
-- from
-- supplement_sales_data_transformed
-- group by 
-- Location
-- order by ROUND(sum(Net_Revenue),2) desc



############################## Location With Higher Return and Lower Margins ###########################

################## •	Relationship between price, discount level, and units sold ###################

-- CREATE VIEW Relationship_price_discount_level_units_sold as 
-- WITH CTE AS (select
-- CASE 
-- WHEN price >=0 and price <=10 THEN '0-10'
-- WHEN price >10 and price <=20 THEN '11-20'
-- WHEN price >20 and price <=30 THEN '21-30'
-- WHEN price >30 and price <=40 THEN '31-40'
-- ELSE '40+'
-- END AS Price_Range,
-- COUNT(*) as Total_orders,
-- CONCAT(ROUND(avg(discount),2) *100,' ','%') as Average_Discount_Percentage,
-- ROUND(SUM(`Units Sold`),2) as Total_Units_Sold,
-- CONCAT((sum(`Units Returned`)/sum(`Units Sold`))*100,' ','%') as Return_Rate 
-- from
-- supplement_sales_data_transformed
-- group by Price_Range
-- )

-- select
-- *
-- from
-- CTE


-- select
-- *
-- from
-- Relationship_price_discount_level_units_sold

################## 	Relationship between price, discount level, and units sold ###################


################# Average Discount by Product Category or Platform ###########

-- create view Average_Discount_Performance_By_Category_Platform_view as 
-- select
-- Category,
-- Platform,
-- Round(avg(discount)*100,2) as Average_Discount_Rate,
-- COUNT(*) as Total_Orders,
-- ROUND(sum(Net_Revenue),2) as Total_Revenue
-- from
-- supplement_sales_data_transformed
-- group by Category ,platform
-- order  by Category

################# Average Discount by Product Category or Platform ###########



######################## Return Rate By Categories #####################
-- create view return_rate_by_Categories_view as 
-- select
-- Category,
-- Round(sum(`Units Returned`)/sum(`Units Sold`)*100,2)as Return_Rate,
-- ROUND(SUM(Net_Revenue),2) as Total_Revenue,
-- count(*) as Total_Orders
-- from
-- supplement_sales_data_transformed
-- group by 
-- Category 
-- order by ROUND(SUM(Net_Revenue),2) desc,Round(sum(`Units Returned`)/sum(`Units Sold`)*100,2) desc

######################## Return Rate By Categories #####################



################################################## •	How much revenue is lost due to returns? ##############################

-- Create view Revenue_Lost_due_to_Returns as 
-- select
-- Round(sum(Net_Revenue),2) as Total_Revenue,
-- ROUND(sum(`units returned`*price),2) as Returns_Revenue_Lost,
-- CONCAT(ROUND((ROUND(sum(`units returned`*price),2)/Round(sum(Net_Revenue),2))*100,2),' ','%') as Total_Revenue_Lost_Percentage
-- from
-- supplement_sales_data_transformed


################################################## •	How much revenue is lost due to returns? ##############################

-- use supplement_project_analysis_db







############################### Showcasing Insights #######################################











select 
*
from

business_performance


select
*
from
monthly_performance_overall




select
*
from
yearly_business_performance_view



select
*
from
category_overall_performance_view


select
*
from
products_overall_performance_view


select
*
from
platform_overall_performance_view


select
*
from
return_behaviour_and_financial_impact_by_platform_view

select
*
from
location_return_lower_margin_view


select
*
from
relationship_price_discount_level_units_sold
order by Price_Range


select
*
from
average_discount_performance_by_category_platform_view


select
*
from
return_rate_by_categories_view



select
*
from
revenue_lost_due_to_returns

