create table amazon_orders
(
order_id integer,
order_date date,
product varchar(100),
price decimal(6,2),
payment_method varchar(20)
);

insert into amazon_orders(1, '2025-04-13', 'Earphones', 30.5, 'UPI');
insert into amazon_orders(2, '2025-04-11', 'Iphone', 500, 'Credit Card');

-- limiting columns or selecting specific columns
select order_id, product from amazon_orders;
--limiting rows
select top 5 * from amazon_orders		-- wil give top 5 rows only 

/*
data types in sql
integer -> 1,2,3, -1, -2 
date -> "2025-04-13"
varchar(100) -> "earphones"
decimal(6, 2) -> 1234.45  	==> here 6 is the length and 2 are numbers after decimal

drive -- folder1 
drive -- folder 2
	

*/