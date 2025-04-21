-- Note: 
	-- *Dates and string should be given in single quotes always ['']
	-- *YYMMDD
	-- for one values we can use "=" operator but for multiple column values use "in"
	-- ">" or "<" or ">=" or "<=" works with all the data types
	-- by default sql server is case insensitive
	-- alias in select clause internally creates a subquery  and then put a where filter
	
--see the data of the table 
select * from Orders

-- see limited COLUMNS
select order_id, order_date from Orders;

-- limit
-- will give top 5 orders
select top 5 order_id, order_date from orders;

-- order BY
-- data will be sorted by order DATE
select order_id, order_date from Orders order by order_date;
select * from orders order by order_date;		-- default is ascending order
select * from orders order by order_date desc  	-- descending order


-- will sort by order_date and then will give top 5 records
select top 5 * from orders  order by order_date desc;


-- to get distint values of a column
-- distinct is used to remove duplicate data 
-- it removes duplicates and displays the data
select DISTINCT ship_mode from orders;
select DISTINCT ship_mode from Orders order by order_date;


-- to get distint values of a column
-- distinct will be applied on all the mentioned COLUMNS

select DISTINCT ship_mode, segment, country from orders;
select DISTINCT * from orders;

-------------------------Filters---------------------------

select * from orders where ship_mode = 'First Class';
select * from orders where order_date = "2025-12-8";
select * from orders where quantity > 5;


-- inequality operators
select * from orders where quantity >= 5;
select order_date, quantity from orders where quantity >= 5;
select order_date, quantity from orders where quantity >= 5 order by quantity;


-- 	ORDER OF EXECUTION

select top 5 order_date, quantity 		-- 4
from orders 							-- 1
where quantity >= 5 					-- 2
order by quantity;						-- 3


select top 5 order_date, quantity 		-- 4
from orders 							-- 1
where quantity >= 5 					-- 2
order by quantity DESC;					-- 3

select *						 		-- 4
from orders 							-- 1
where order_date < '2025-12-08' 		-- 2
order by order_date DESC					-- 3

-- between keyword on dates

select *						 		
from orders 							
where order_date between '2025-04-01' and '2025-05-01'		
order by order_date; 

-- between keyword on integers

select *						 		
from orders 							
where quantity between 3 and 5	
order by order_date desc;

-- filtering multiple column values using "in" opertor
-- works with integer as well as date	
select * from orders where ship_mode in('First Class', 'Same Day');		-- filters column with value first class and same Day

-- to see filter is working fine or not
select distinct from orders where ship_mode in('First Class', 'Same Day');

select * from orders where quantity in(3, 5) order by quantity desc;		-- will give all the records where quantity is either 3 or 5
select * from orders where quantity in(3, 5, 4) order by quantity desc;		-- we can give as many values as we want

-- not in operator
-- works with int, date etc everything.
select DISTINCT ship_mode, segment, country from orders where ship_mode not in('First Class', 'Same Day');

-- ">" or "<" or ">=" or "<=" works with int and dates 
-- when we use it with string we get result based on ascii value, when we sort the data it is sorted based on ascii value

select DISTINCT ship_mode, segment, country from orders where ship_mode > 'First Class';
select DISTINCT ship_mode, segment, country from orders where ship_mode >= 'Second Class';

-- filtering data on 2 COLUMNS "AND"
SELECT order_date , ship_mode, segment from orders where ship_mode = 'First Class' and segment = 'Consumer';

-- filtering data on 2 COLUMNS "OR"
SELECT order_date ,ship_mode, segment from orders where ship_mode = 'First Class' or segment = 'Consumer';

-- "OR" condition using "in" clause
select disctinct from orders where ship_mode in('First Class', 'Same Class');
select disctinct from orders where ship_mode = 'First Class' or segment = 'Consumer'; -- filtering is happening row by row

select *,profit/sales as ratio,profit*sales,getdate() as total
from orders
where order_date between  '2022-11-01 12:00:00' and  '2022-11-01 12:40:00'
order by order_date
;
--pattern matching like operator
-- eg we want name starting with chris and anything after that 
select order_id,order_date,customer_name
from orders
where customer_name like 'Chris%';

-- eg we want name ending with t
select order_id,order_date,customer_name
from orders
where customer_name like '%t';

--eg we want name start can be anything and ending can be anything but in between i want word "ven"
select order_id,order_date,customer_name
from orders
where customer_name like '%ven%';

-- eg we want name starting with A and ending with a
-- by default sql server is case insensitive
-- code for making sql server case senitive 
-- after running the below script import the db again
-----------BEGIN------------
USE "namastesql"
GO
ALTER DATABASE "namastesql" SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO
ALTER DATABASE "namastesql" COLLATE Latin1_General_CS_AS;

USE "namastesql"
ALTER DATABASE "namastesql" SET MULTI_USER
GO
------------END--------------

select order_id,order_date,customer_name,upper(customer_name) as name_upper
from orders
where upper(customer_name) like 'A%a' ;

-- suppose there is a name that is like Alex AvialA
-- upper() function will change the case to upper case 
Select order_id,order_date,customer_name,upper(customer_name) as name_upper
from orders
where upper(customer_name) like 'A%A' ;


-- underscore("_") means there should be atleast one character
-- underscore * amount of characters before the letter or word
-- eg there shoule be one character before L 
select order_id,order_date,customer_name
from orders
where customer_name like '_l%' ;

-- eg there shoule be 3 characters before the letter or word
select order_id,order_date,customer_name
from orders
where customer_name like '___l%' ;
-- % means 0 or more any characters
-- _ means one character

-- will ignore the percetage symbole and will act as string value
-- eg name is Vedant% Kadam and we want to search all the names start with Vedant
select order_id,order_date,customer_name
from orders
where customer_name like '___l%' escape '%';


-- eg when we want name to start with C but second character should have a,l,b or o
select order_id,order_date,customer_name
from orders
where customer_name like 'C[albo]%'

-- eg when we  want name to start with C but second character shouldn't be a,l,b or o
select order_id,order_date,customer_name
from orders
where customer_name like 'C[^albo]%';

-- range 
-- eg when we want name to start with C but second character should be in range
Select order_id,order_date,customer_name
from orders
where customer_name like 'C[a-f]%' order by customer_name;

-- numerics
-- third character as 1 or 2
Select order_id,order_date,customer_name
from orders
where order_id like 'CA-20[1-2]%' order by customer_name;

-- fourth character can be 0 or 1
Select order_id,order_date,customer_name
from orders
where order_id like 'CA-202[1-2]%' order by customer_name;


select order_id,order_date,customer_name
from orders
where order_id like 'CA-20[][1-2]%'
order by customer_name






