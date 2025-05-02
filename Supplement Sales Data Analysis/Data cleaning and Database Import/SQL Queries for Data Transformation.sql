
############################# Queries for Database creation and Data Transformation ##############################

-- create database Supplement_project_analysis_db



##################################### Creating a duplicate table to work with ##############################
# use supplement_project_analysis_db

-- create table supplement_sales_data_transformed
-- select
-- *
-- from
-- supplement_sales_data_raw

##################################### Creating a duplicate table to work with ##############################



################################################# Creating Extra Columns for Transformation #############################
-- select
-- Distinct
-- Year(Date)
-- from
-- supplement_sales_data_transformed


-- alter table supplement_sales_data_transformed modify column Date date

-- Update supplement_sales_data_transformed 
-- Set Year = Year(Date)

-- select
-- Distinct 
-- month(Date)
-- from 
-- supplement_sales_data_transformed

-- -- alter table supplement_sales_data_transformed add column month int

-- Update supplement_sales_data_transformed 
-- Set month = month(Date)

-- alter table supplement_sales_data_transformed add column Net_Revenue double

-- select
-- Revenue,
-- ROUND(Revenue - (`Units Returned` * Price),2) as Net_Revenue
-- from

-- supplement_sales_data_transformed

-- update supplement_sales_data_transformed 
-- set Net_Revenue = ROUND(Revenue - (`Units Returned` * Price),2)




################################################# Creating Extra Columns for Transformation #############################


