-- index : like and not like keyword, Filtering null values, count, aggregate functions, group by, having keyword

-- NOTE:
	-- Null is not  blank nor zero. It is unknown. Null is not comparable. We cannot say null is equal to something or Null is equal to null.
	-- Distinct and group by are same  
	--any aggregate function will always ignore the null values
 

-- not like 
-- eg i want a names which does not start with V and ends with t
select * from customers where customer_name not like 'V%t';
select * from customers where customer_name not like 'V' and customer_name not like 't';
select * from customers where not(customer_name like 'V' and customer_name like 't');

-- order by clause is executed after select clause
-- we cannot use ratio column in where clause thus this proves where clause is executed first and then select 
-- order of execution ==> from --> where --> select --> order by --> top 5
select top 5 *, profit/sales as ratio 
from orders 
where category='Furniture'
order by ratio desc;

-- how do we work with null values 
update orders 
set city = null;
where order_id in ('1223', '322', 343433', 'aas7s7s203j');

select* from order where order_id in ('1223', '322', 343433', 'aas7s7s203j');

--this will not work 
select * from orders where city=null;

--------------Filtering Null Values------------------
-- for selecting null values we have a special keyword "is null"
-- we have key word "is not null" as well
-- we can use whatever conditions after it like and, or, between etc.
select * from order where city is null;
select * from orders where city is not null


--------------Aggregation Functions-------------------------
-- used to generate some reports
-- eg if we want number of records from table we use "count()" function
select count(*) as count from orders;

-- eg if we want to see total sales we use "sum()" function
select count(*) as count, sum(sales) as total from orders;

-- eg if want maximum or minimum sale then we use max() or min() function
select count(*) as count, sum(sales) as total, max(sales) as max_sales from orders;
select count(*) as count, sum(sales) as total, max(sales) as max_sales, min(profit) as min_profit from orders;

-- eg if we want to do average we use "avg()" function
select count(*) as count, sum(sales) as total, max(sales) as max_sales, min(profit) as min_profit, avg(profit) as avg_profit from orders'
select * from order order by desc;

---------------Group By---------------
-- it is same as pivot table
-- it will give you records based on region 
select region, count(*) as count,
sum(sales) as total, 
max(sales) as max_sales, 
min(profit) as min_profit, 
avg(profit) as avg_profit 
from orders
group by region;

-- group by is similar to distinct function
-- advantage of group by is we can have aggregated values
select region from orders group by region;
select distinct region from orders group by region;
select region, sum(sales) as sales from orders group by region;

- disctinct combination of 2 columns using group by
select region, city, sum(sales) as sales from orders group by region, city;	-- will get distinct combination of region and city
-- will get distinct combinations of region and category
select region, category,sum(sales) as sales from orders group by region, category;

----------interview question------------

-- what will be the output of this ?
select region, category,sum(sales) as sales from orders group by region; 
ans :  it will give error, if you are using group by then in select clause you can have only columns which are present in group by or have aggredated columns 

----------------------------------------

select region, sum(sales) as sales from orders group by region;
select region, sum(sales) as sales 	-- 4
from orders 				-- 1
where profit>50 			-- 2
group by region;			-- 3

select region, sum(sales) as sales 	-- 4
from orders 				-- 1
where profit>50 			-- 2
group by region				-- 3
order by total_sales desc;		-- 5

---------having keyword----------
-- having keyword will be used with group by or after group by.
-- works as where clause but with agggregated columns.
-- columns present in group by can be used in having.
-- we can use having instead of where but having is meant for aggregated functions.
-- in below eg we are grouping all the data and then filtering on having condition. it is an overhead to the database i.e query might take time to execute.
-- aggregation is a costly function
select sub_category, sum(sales) as total_sales
from orders
group by sub_category
having sum(sales) > 100000
order by total_sales desc;

-- using having and where 
select sub_category, sum(sales) as total_sales
from orders				-- 1
where profit > 50			-- 4
group by sub_category			-- 2
having sum(sales) > 100000		-- 3
order by total_sales desc;

-- using max() with having 
select top 5 sub_category, sum(sales) as total_sales
from orders				-- 1
group by sub_category			-- 2
having max(order_date) > '2025-01-01'	-- 3
order by total_sales desc;

-- we can do max() and min() on the string columns as well
--  we cannot do sum(), avg() etc on string
select max(category) from orders;

-----------need to re run this----
select sub_category, sum(sales) as total_sales, max(order_date)
from orders				
group by sub_category			
having max(order_date) > '2025-01-01'	
order by total_sales desc;

select count(distinct category) from orders;

-- count(0) or count(1) or count(*) are smae. both will give same values
-- count() does not count null values
--any aggregate function will always ignore the null values
select count(distinct category), count(1)from orders;
select count(*), count(city)from orders;
 









