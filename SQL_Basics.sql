-- DDL ==> Data Defination Language(structure is changing)

create table amazon_orders
(
order_id integer,
order_date date,
product varchar(100),
price decimal(6,2),
payment_method varchar(20)
);

-- deleting table
--drop table table_name
drop table amazon_orders

-- DMl ==> Data Manipulation Language (structure is not changing)
insert into amazon_orders values(1, '2025-04-13', 'Earphones', 30.5, 'UPI');
insert into amazon_orders values(2, '2025-04-11', 'Iphone', 500, 'Credit Card');

-- to delete data
delete from amazon_orders;


--DQL ==> data querying language
-- limiting columns or selecting specific columns
select order_id, product from amazon_orders;
--limiting rows
select top 5 * from amazon_orders		-- wil give top 5 rows only 
-- data sorting	=> default is ascending order but if we mention DESC it will show result in descending order(latest orders first)
select * from amazon_orders
order by order_date desc 
--data sorting on multiple columns ==> first it will sort by order_date and then by prodcut_name
select * from amazon_orders
order by order_date DESC, product asc 
	

/*
data types in sql
integer -> 1,2,3, -1, -2 
date -> "2025-04-13"
varchar(100) -> "earphones"
decimal(6, 2) -> 1234.45  	==> here 6 is the length and 2 are numbers after decimal

drive -- folder1 
drive -- folder 2
	

*/

-- creating table in another schema (dbo is the default schema)

Security => right click => new schema => hr 
creata table hr.test(
id integer,
name varchar(50),
Position(50),
salary integer
);

insert into hr.test values(111, "Vandana", "HRBP", 100000);
select * from hr.test;


-- inserting data from differnt table(structure should be same )

Security => right click => new schema => sales
creata table sales.test(
id integer,
name varchar(50),
Position(50),
salary integer
);

insert into sales.test select id, name, Position, salary from hr.test
select * from sales.test;

--NOTE:
-- if table 1 contains 2 columns and table 2 contains 3 columns then the data will not get inserted so the structure should be same.
