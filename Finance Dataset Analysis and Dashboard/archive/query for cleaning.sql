-- alter table personal_transactions_dashboard_ready add column Total_Expenses_debit double
-- alter table personal_transactions_dashboard_ready add column Total_Income_credit double

-- select
-- *
-- from 
-- personal_transactions_dashboard_ready

-- update personal_transactions_dashboard_ready
-- set Total_Expenses_debit = (
-- select 
-- CASE WHEN `Transaction Type` = 'debit' THEN Amount ELSE 0 END
-- )

-- update personal_transactions_dashboard_ready
-- set Total_Income_credit = (
-- select 
-- CASE WHEN `Transaction Type` = 'credit' THEN Amount ELSE 0 END
-- )

WITH Net_SAV as (select
month(Date) as Month_No,
monthname(Date) as Month_Name,
ROUND(SUM(Total_Income_credit) - sum(Total_Expenses_debit),2) as Net_Savings
from 
personal_transactions_dashboard_ready
group by month(Date) , monthname(Date)
)
,
PREV AS (select
*,
lag(Net_Savings) over(order by Month_No) as Prev_Mon_Saving
from
Net_SAV
)

select
Month_Name,
Net_Savings,
Prev_Mon_Saving,
CONCAT(Round((Net_Savings - Prev_Mon_Saving)/Prev_Mon_Saving *100,2),' ','%') as Growth_Rate
from
PREV