
####################################################### Date Cleaning #####################################################################


-- Select
-- `Date`,
-- str_to_date(`Date`,'%d/%m/%Y')
-- from
-- daily_household_db.daily_household2


########################################### Fixed Date Column #################################################
-- UPDATE daily_household2
-- SET `Date` = 
--     CASE
--         -- If the date includes time, extract and format it
--         WHEN LENGTH(`Date`) > 10 THEN
--             STR_TO_DATE(
--                 SUBSTRING_INDEX(`Date`, ' ', 1),  -- Extract the date part
--                 '%d/%m/%Y'  -- Specify the date format
--             )
--         -- If the date does not include time, pad single-digit day/month with zeros
--         ELSE
--             STR_TO_DATE(
--                 CONCAT(
--                     LPAD(SUBSTRING_INDEX(`Date`, '/', 1), 2, '0'), '/',  -- Day
--                     LPAD(SUBSTRING_INDEX(SUBSTRING_INDEX(`Date`, '/', 2), '/', -1), 2, '0'), '/',  -- Month
--                     SUBSTRING_INDEX(`Date`, '/', -1)  -- Year
--                 ),
--                 '%d/%m/%Y'  -- Specify the date format
--             )
--     END;

-- Alter table daily_household2
-- Modify Column `Date` date

########################################### Fixed Date Column #################################################


############################################### Fixed Mode Column #############################################

-- Select
-- Distinct
-- Mode
-- from
-- daily_household_db.daily_household2


#### Fixed Saving Bank Account Category 
# Where Mode Like 'Saving Bank%'

-- Update daily_household2 
-- Set Mode = 'Saving Bank Account' 
-- Where Mode Like 'Saving Bank%'

# Fixed Saving Bank Account Category 

### Fixed Equity Mutual Fund Category 
-- Select
-- Distinct 
-- Mode 
-- from
-- daily_household2
-- Where 
-- Mode Like 'Equity Mutual Fund%'

-- Update daily_household2 
-- Set Mode = 'Equity Mutual Fund'
-- Where Mode Like 'Equity Mutual Fund%'

### Fixed Equity Mutual Fund Category 

############################################### Fixed Mode Column #############################################
-- Select
-- *
-- from
-- daily_household2


####################################### Fixed Category Column###############################################

-- Select
-- Category
-- from
-- daily_household2

-- Update daily_household2
-- Set Category = Upper(Category)

-- Update daily_household2
-- Set Category = 'Household Help Worker'
-- Where category like 'cook' or category like 'maid'

-- Update daily_household2
-- Set Category = 'Scrap Sale'
-- Where category like 'scra%'

-- Update daily_household2
-- Set Category = 'Cashback and Rewards'
-- Where
-- Category Like 'Amazon pay%' or category Like 'Gpay%'

-- Update daily_household2
-- Set Category = 'Stock Market Investment'
-- Where Category Like 'Share%' or Category Like 'Dividend earned on%'


-- Update daily_household2
-- Set Category = 'Equity Mutual Fund'
-- Where Category Like 'Equity%' 

-- Update daily_household2
-- Set Category = 'Saving Bank Account'
-- Where Category Like 'Saving Bank%' 

-- Update daily_household2
-- Set Category = 'Small Cap Fund'
-- Where Category Like 'Small Cap%' 

####################################### Fixed Category Column###############################################



########################################################## Fixed Subcategory Column ##################################################################
-- Select
-- Distinct
-- Subcategory
-- from
-- daily_household2

-- Update daily_household2 
-- Set Subcategory = Upper(Subcategory)

-- Update daily_household2
-- Set Subcategory  = Category 
-- Where 
-- Subcategory is null and Category is not Null

########################################################## Fixed Subcategory Column ##################################################################

########################################################## Fixed Note Column #################################################################
-- Select
-- *
-- from
-- daily_household2

-- Update daily_household2
-- Set Note = 'Unknown'
-- Where 
-- Note is NULL

########################################################## Fixed Note Column #################################################################


######################################################### Duplicate Check #################################################
-- Select *
-- from
-- (Select
-- *,
-- rank() over(partition by `Date`,'Mode','Category','Subcategory','Note','Amount','Income/Expense','Currency') as Ranking
-- from
-- daily_household2
-- ) as Inner_query
-- Where
-- Inner_query.Ranking>=1

######################################################### Duplicate Check #################################################



################################################################### Data Cleaning ###############################################################################################3



##################################################################### Exploratory Data Analysis and Insights #################################################################################

# Q1 Retrieve all transactions with **Date, Mode, Category, Subcategory, Amount, and Income/Expense**.  

-- Select
-- *
-- from
-- daily_household2


# Q2 Count the **total number of transactions**.  
--  Select
--  Count(*) as Total_No_Of_Transactions   ### 2461 Transactions Have Been Made so far
--  from 
--  daily_household2

 
 # Q3 Count the number of **unique modes of transaction**.  
--  Select
--  Count(Distinct Mode) as Transaction_Modes  ### 8 Modes 
--  from daily_household2

# Skipping Q4,Q5 

# Q 6 Find transactions where the **Amount is negative or zero** (possible data errors).  
-- Select
-- *
-- from
-- daily_household2   ### No Issue with Amount 
-- Where 
-- Amount <0

# Q7 Get the **first and last transaction date** in the dataset.  

-- Select
-- MIN(`Date`) as First_Date,   ### First Date is 2015-01-01
-- MAX(`Date`) as Last_Date     ### Last Date is 2018-09-20
-- from
-- daily_household2 

# Q8 Find the total **number of Income vs Expense transactions**.  
-- Select
-- `Income/Expense`,
-- Count(*) as No_Of_Transactions    ## Expense 2176 , Transfer-Out 160 , Income 125 Most of the Transactions Are Expense which is Logical 
-- from
-- daily_household2
-- Group by 
-- `Income/Expense`

-- # Q9 Count how many transactions were made **each day of the week**. 
-- Select
-- Case
-- When weekday(`Date`)  = '0' Then 'Monday'
-- When weekday(`Date`)  = '1' Then 'Tuesday'                      # Sunday 428,Monday 405 , Tuesday 354 , Thursday 353 , Saturday 335 , Wednesday 293 , Friday 293 
-- When weekday(`Date`)  = '2' Then 'Wednesday'
-- When weekday(`Date`)  = '3' Then 'Thursday'                     
-- When weekday(`Date`)  = '4' Then 'Friday'
-- When weekday(`Date`)  = '5' Then 'Saturday'
-- When weekday(`Date`)  = '6' Then 'Sunday'
-- Else 'Invalid'
-- End as Week_Day,
-- Count(*) as Transactions_Made
-- from
-- daily_household2 
-- group by 
-- Week_Day
-- Order by 
-- Count(*) desc   


-- # Q10  Retrieve the most frequently occurring **subcategory**.  
-- Select
-- Category,
-- Count(Category) as Occuring_Of_Category
-- from
-- daily_household2                    ########### Food is the most Frequently Occuring Cateogry with 907 Occurings 
-- Group by Category
-- Order by  Count(Category) desc
-- Limit 1


################################################### KPI's Based Analyis ###################################################
-- #Q11  Calculate **total income, total expense, and net savings**.
-- select 
-- SUM(CASE When `Income/Expense` = 'Income' then Amount Else 0 End) as Total_Income,   ########### Total Income '3042397.35'
-- SUM(CASE When `Income/Expense` = 'Expense' then Amount Else 0 End) as Total_Expenses, ##########   Total Expenses '1957390.5299999998'
-- SUM(CASE When `Income/Expense` = 'Transfer-Out' then Amount Else 0 End) as Transfer_out_Amount, ######### Transfer_out_Amount '1770780.9'
-- SUM(CASE When `Income/Expense` = 'Income' then Amount Else 0 End) - SUM(CASE When `Income/Expense` = 'Expense' then Amount Else 0 End) as Net_Savings ####### Net-Savings '1085006.8200000003'
-- from 
-- daily_household2 

# Q12 Determine the **monthly savings rate** (`Net Savings / Total Income`).  

-- Select
-- Inner_Query.Net_Savings/Inner_Query.Total_Income *100 as Total_Monthly_Savings_Rate          ##################### 35 Percent Saving Rate 
-- from
-- (select 
-- SUM(CASE When `Income/Expense` = 'Income' then Amount Else 0 End) as Total_Income,   ########### Total Income '3042397.35',
-- SUM(CASE When `Income/Expense` = 'Income' then Amount Else 0 End) - SUM(CASE When `Income/Expense` = 'Expense' then Amount Else 0 End) as Net_Savings ####### Net-Savings '1085006.8200000003'
-- from 
-- daily_household2 
-- ) as Inner_Query

# Q13 Find the **top 3 highest spending categories**.  
-- select
-- category,
-- ROUND(SUM(Amount),2) as Total_Spending   # 1 Money Transfer 606528.9  2 Investment 271858  3 Transportation  
-- from
-- daily_household2
-- Where
-- `Income/Expense` = 'Expense'
-- Group by Category
-- Order by SUM(Amount) desc
-- limit 3

#  Q14 Identify the **highest single expense transaction** and its category.  

-- Select
-- Category,
-- Amount
-- from
-- daily_household2
-- Where `Income/Expense` = 'Expense'   ### 100000  Money Transfer
-- order by Amount DESC
-- limit 1

# Q15 Calculate the **average expense amount per category**.  

-- Select
-- Category,
-- AVG(Amount) as Average_Expense
-- from
-- daily_household2
-- Where 
-- `Income/Expense` = 'Expense'     ## Money Transfer 14105 on top and other then 
-- group by Category 
-- order by AVG(Amount) desc

# Q16 Identify the **total number of high-value transactions (above ₹10,000)**.  
-- Select
-- Count(*) as Above_10k_Transactions  ### 100 Transactions are Made above 10k 
-- from
-- daily_household2
-- Where
-- Amount >10000

-- # Q17 Find the category with the **lowest total spending**.  
-- Select
-- category,
-- SUM(Amount) as Total_Spending
-- from
-- daily_household2
-- Where 
-- `Income/Expense` = 'Expense' # Garbage Disposal 67 INR
-- group by 
-- category
-- order by SUM(Amount)
-- limit 1

# Q18 Determine the **total income from salary vs other sources**.  
-- Select
-- SUM(CASE WHEN Category = 'Salary' THEN Amount ELSE 0 END ) AS Salary_Income , ####### Salary Income '2526576.45'
-- SUM(CASE WHEN Category != 'Salary' THEN Amount ELSE 0 END ) AS Income_By_Other_Sources ###### Income from Other Sources '515820.9'
-- from
-- daily_household2
-- where
-- `Income/Expense`='Income'

# Q19 Find the **most common mode of transaction for large transactions**.
-- SELECT 
--     Mode, 
--     COUNT(*) AS Transactions 
-- FROM daily_household2 
-- WHERE Amount > 10000  ## Saving Bank Account 91 Trancactions 
-- GROUP BY Mode 
-- ORDER BY COUNT(*) DESC 
-- LIMIT 1;

# Q20 Identify the **top 5 subcategories where the most money was spent**.  
-- select
-- SubCategory,
-- sum(Amount) as Total_Spending
-- from
-- daily_household2
-- where 
-- `Income/Expense` = 'Expense'  # 1 Money Transfer 402023 , 2 Public Provident Fund '240000' , 3 Home '204505.9' , 4 Bike '94593' , 5 Other '87025.28'
-- group by SubCategory
-- order by sum(Amount) desc
-- Limit 5 
################################################### KPI's Based Analyis ###################################################

############################################################## **🔹 Trend & Pattern Analysis**###############################################################  
# Q21 Find the total **monthly income and expenses** over time.  

-- Select
-- date_format(`Date`,'%Y-%m') as Month,
-- SUM(Case When `Income/Expense` = 'Income' THEN Amount Else 0 END) as Total_Income,
-- SUM(Case When `Income/Expense` = 'Expense' THEN Amount Else 0 END) as Total_Expense
-- from
-- daily_household2
-- group by Month
-- Order By Month

# Q22  Identify the **day of the week with the highest spending**.  
-- Select
-- Case
-- When weekday(`Date`)  = '0' Then 'Monday'
-- When weekday(`Date`)  = '1' Then 'Tuesday'                    
-- When weekday(`Date`)  = '2' Then 'Wednesday'
-- When weekday(`Date`)  = '3' Then 'Thursday'                     # Tuesday '1647184.08'
-- When weekday(`Date`)  = '4' Then 'Friday'
-- When weekday(`Date`)  = '5' Then 'Saturday'
-- When weekday(`Date`)  = '6' Then 'Sunday'
-- Else 'Invalid'
-- End as Week_Day,
-- SUM(Amount) as Total_Spending
-- from
-- daily_household2
-- group by Week_Day
-- order by SUM(Amount) DESC

# Q23  Determine which **category has the most variable spending** over time.  
-- SELECT 
--     Category,
--     STDDEV(Amount) AS Spending_Variability
-- FROM daily_household2
-- WHERE `Income/Expense` = 'Expense'   # Touurism has Most Spending_Variavility '16970.139826518815'
-- GROUP BY Category
-- ORDER BY Spending_Variability DESC
-- LIMIT 1;

# Q24  Find the months where **expenses exceeded income**.  
 
--  Select
--  *
--  from
-- (Select
--  month(`Date`) as Month,
--  ROUND(SUM(Case WHEN `Income/Expense` = 'Income' THEN Amount ELSE 0 END),2) as Total_Income,
--  Round(SUM(Case WHEN `Income/Expense` = 'Expense' THEN Amount ELSE 0 END),2) as Total_Expense       ### In 4 years No Months are There Where Total Expense Exceeds Total Income 
--  from 
--  daily_household2
--  GROUP BY 
--  Month
--  ) as Inner_query
--  Where Inner_Query.Total_Expense > Inner_Query.Total_Income

# Q25 Identify the **fastest-growing** expense category over the last 6 months.  

-- WITH Monthly_Expenses AS (
--     SELECT 
--         Category,
--         MONTH(`Date`) AS Month,
--         YEAR(`Date`) AS Year,
--         SUM(Amount) AS Total_Expense
--     FROM daily_household2
--     WHERE `Income/Expense` = 'Expense'
--     GROUP BY Category, YEAR(`Date`), MONTH(`Date`)
-- ),
--   
-- Expense_Growth AS (
--     SELECT 
--         Category,
--         Month,
--         Year,
--         Total_Expense,
--         LAG(Total_Expense) OVER (PARTITION BY Category ORDER BY Year, Month) AS Previous_Month_Expense,
--         ROUND(((Total_Expense - LAG(Total_Expense) OVER (PARTITION BY Category ORDER BY Year, Month)) / NULLIF(LAG(Total_Expense) OVER (PARTITION BY Category ORDER BY Year, Month), 0)) * 100, 2) AS Growth_Percentage
--     FROM Monthly_Expenses
-- )
-- SELECT 
--     Category,
--     AVG(Growth_Percentage) AS Avg_Growth_Rate
-- FROM Expense_Growth
-- WHERE Month >= MONTH(CURDATE()) - 6  -- Last 6 months
-- GROUP BY Category
-- ORDER BY Avg_Growth_Rate DESC
-- LIMIT 1;                           ######################### APPEAREL Category WITH AVG growth rate '2483.215454545455'


####### Not Solved  Q26 Find the **average monthly spending trend** for the last year.  


-- # Q27 Rank **categories by total spending** using `RANK()`.  
-- Select
-- category,
-- SUM(Case WHEN `Income/Expense` = 'Expense' THEN Amount ELSE 0 END ) as Total_Spending,
-- rank() over( order by SUM(Case WHEN `Income/Expense` = 'Expense' THEN Amount ELSE 0 END ) DESC) as Ranking     ###### Money Transfer has Ranking of 1 
-- from
-- daily_household2
-- group by 
-- category 

# Q28 Identify the **month with the highest overall expenses**.  
-- Select
-- month(`Date`) as Month,
-- SUM(CASE WHEN `Income/Expense` = 'Expense' THEN Amount ELSE 0 END) AS Overall_Expenses   ### Month 1 Means january '332183.32'
-- from
-- daily_household2
-- group by Month 
-- order by SUM(CASE WHEN `Income/Expense` = 'Expense' THEN Amount ELSE 0 END) desc
-- limit 1


-- # Q29 Find the **most expensive transaction per category**.  
-- SELECT 
--     Category, 
--     MAX(Amount) AS Most_Expensive_Transaction
-- FROM daily_household2
-- WHERE `Income/Expense` = 'Expense'  #### Money Transfer NO 1 '100000'
-- GROUP BY Category
-- ORDER BY Most_Expensive_Transaction DESC;

# Q30 Calculate the **rolling 3-month average spending** per category.  
-- SELECT 
--     Category,
--     MONTH(`Date`) AS Month,
--     YEAR(`Date`) AS Year,
--     SUM(CASE WHEN `Income/Expense` = 'Expense' THEN Amount ELSE 0 END) AS Monthly_Spending,
--     ROUND(AVG(SUM(CASE WHEN `Income/Expense` = 'Expense' THEN Amount ELSE 0 END)) 
--           OVER (PARTITION BY Category ORDER BY YEAR(`Date`), MONTH(`Date`) 
--           ROWS BETWEEN 2 PRECEDING AND CURRENT ROW), 2) AS Rolling_3_Month_Avg
-- FROM daily_household2
-- WHERE `Income/Expense` = 'Expense'
-- GROUP BY Category, YEAR(`Date`), MONTH(`Date`)
-- ORDER BY Category, Year, Month;

