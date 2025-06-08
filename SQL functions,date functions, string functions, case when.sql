
-- NOTE : 
	--For More Functions checkout on google :- datepart sql server, or functions in sql server


-- STRING_AGG function

-- datepart is a function gives part of the date like year, month, date 
-- first parameter is year , it expects one or more parameter, second parameter is from which column you want year
select order_id, order_date, datepart(year, order_date) AS year_or_order_date from orders;
select order_id, order_date, datepart(year, order_date) AS year_or_order_date from orders where datepart(year, order_date) = 2020;
-- month
select order_id, order_date, datepart(year, order_date) AS year_or_order_date, datepart(month, order_date) AS month_or_order_date from orders;
-- day of week
select order_id, order_date, 
datepart(year, order_date) AS year_of_order_date, 
datepart(month, order_date) AS month_of_order_date 
datepart(week, order_date) AS week_of_order_date 
from orders;
-- you can also pass yyyy, yy, qq, q, mm, m, dy, ww, wk, etc 
-- day of week
select order_id, order_date, 
datepart(yyyy, order_date) AS year_of_order_date, 
datepart(mm, order_date) AS month_of_order_date 
datepart(wk, order_date) AS week_of_order_date 
from orders;

--DATEADD if function to add dates
select order_id, order_date,
DATEADD(day, 5, order_date) as order_date_5 	-- will add 5 days  to order_Date
DATEADD(week, 5, order_date) as order_week_5 	-- will add 5 weeks to order_date
from orders;

-- subtract days or weeks 
select order_id, order_date,
DATEADD(day, 5, order_date) as order_date_5 	-- will add 5 days  to order_Date
DATEADD(week, -5, order_date) as order_week_5 	-- will subtract 5 weeks to order_date
from orders;

-- Datediff is function used to find difference between to and from date 
-- can you day, week, month etc
select order_id, order_date, ship_date,
Datediff(day, order_date, ship_date) as date_difference_days
from orders;

-- Case Statement 
-- case statements are always executed top to bottom as soon as it satisfies the condition it will stop.
-- it is similar to if else statements
select order_id, profit,
Case
WHEN profit < 100 then 'Low Profit'
WHEN profit < 250 then 'Medium Profit'
WHEN profit < 400 then 'High Profit '
else 'Veryb High Profit'
end as profit_category 			--> its alias
from orders;

select order_id, profit,
Case
WHEN profit < 0 then 'Loss' 
WHEN profit >= 100 and profit < 250 then 'Medium Profit'
WHEN profit < 100 then 'Low Profit'
WHEN profit >= 250 and pprofit < 400 then 'High Profit '
else 'Veryb High Profit'
end as profit_category 			--> its alias
from orders;


select order_id,profit,
case
when profit < 100 then 'Low Profit'
when profit < 250 then 'Medium Profit'
when profit < 400 then 'High Profit'
else 'Very high profit'
end as profit_category
,case
when  profit < 0 then 'Loss'
when profit  >= 100 and profit < 250 then 'Medium Profit'
when profit < 100 then 'Low Profit'
when profit >=250 and profit < 400 then 'High Profit'
else 'Very high profit'
end as profit_category
from orders
;





