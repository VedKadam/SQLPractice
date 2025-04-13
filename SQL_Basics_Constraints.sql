Covered : alter table, constraints, delete and update basic

Note: we can add as many constraint as we want 

create table amazon_orders
(
order_id integer,
order_date date,
product varchar(100),
price decimal(6,2),
payment_method varchar(20)
);

-- change the data type of columns
alter table amazon_orders alter column order_date datetime	--DDL
select * from amazon_orders	--DDL data type should be compatible 
-- if table is empty we can change from any data type to any other data type 
-- we can change it to hyer data type but not to lower unless its not more/less than the specified amount

insert into amazon_orders values(2, '2025-04-11 03:06:40', 'Trimmer', 10.12, 'Credit Card');

-- adding new columns in existing table(use alter table)	alter statement will always add the column in the last
alter table amazon_orders add user_name varchar(30);
alter table amazon_orders add category varchar(30);

-- delete a column from existing table ==> cannot add multiple columns
drop table amazon_orders drop column category;

-- Not null
create table a_orders(
order_id integer NOT NULL,		-- not null constraint
order_date date, 
product_name varchar(30),
total_price decimal(6, 2),
payment_method varchat(20) check(payment method in ('UPI', 'Credit Cart'))	-- check contraint	
);

insert into a_orders values(null, '2025-04-11', 'Trimmer', 10.12, 'Credit Card');	-- cannot insert null
insert into a_orders values(1, '2025-04-11', 'Trimmer', 10.12, 'Credit Card');

-- check constraint
insert into a_orders values(1, '2025-04-11', 'Trimmer', 10.12, 'Net Banking');
-- it will not insert net banking because of the check constraint


-- unique constraint 
-- ==> we should have unique records for that column, 
-- ==> cannot contain duplicates. 
-- ==> can have null values
-- ==> we can have multiple UNUQUE keys in a table
drop table a_orders	
create table a_orders(
order_id integer NOT NULL UNIQUE,		-- not null and UNIQUE constraint
order_date date, 
product_name varchar(30),
total_price decimal(6, 2),
payment_method varchat(20) check(payment method in ('UPI', 'Credit Cart'))	-- check contraint
discount integer check(discount <= 20)		-- check contraint 	
);

-- default constraint ==> adding default value for a column if we add no value for it. We need to mention columns in the insert query so that we can add default values 
drop table a_orders;
create table a_orders(
order_id integer NOT NULL UNIQUE,		-- not null and UNIQUE constraint
order_date date, 
product_name varchar(30),
total_price decimal(6, 2),
payment_method varchat(20) check(payment method in ('UPI', 'Credit Cart'))	-- check contraint
discount integer check(discount <= 20)		-- check contraint 	
category varchar(20) default 'Accessories'	-- default constraint
);
insert into a_orders(order_id, order_data, product, price, payment_method, discount) values(1, '2025-04-11', 'Trimmer', 10.12, 'UPI', 20);
insert into a_orders(order_id, order_data, product, price, payment_method, discount) values(1, '2025-04-11', 'Trimmer', 10.12, 'UPI', default);

--Primary key constraints
-- * we cannot have duplicates similar to UNIQUE Key
-- * we cannot have null values 
-- * we can add primary key as a combination of more than one column
-- * we can have only one primary key in a table and multiple unique in a table

drop table a_orders;	
create table a_orders(
order_id integer,		
order_date date, 
product_name varchar(30),
total_price decimal(6, 2),
payment_method varchat(20) check(payment method in ('UPI', 'Credit Cart')),	-- check contraint
discount integer check(discount <= 20),		-- check contraint 	
category varchar(20) default 'Accessories'	-- default constraint
primary key order_id		-- primary key
);

OR

drop table a_orders;	
create table a_orders(
order_id integer primary key,		-- primary key 
order_date date, 
product_name varchar(30),
total_price decimal(6, 2),
payment_method varchat(20) check(payment method in ('UPI', 'Credit Cart')),	-- check contraint
discount integer check(discount <= 20),		-- check contraint 	
category varchar(20) default 'Accessories'	-- default constraint
);

--  assigning primary key to multiple columns 
drop table a_orders;	
create table a_orders(
order_id integer,		
order_date date, 
product_name varchar(30),
total_price decimal(6, 2),
payment_method varchat(20) check(payment method in ('UPI', 'Credit Cart')),	-- check contraint
discount integer check(discount <= 20),		-- check contraint 	
category varchar(20) default 'Accessories'	-- default constraint
primary key (order_id, product);		-- primary key
);

insert into a_orders(order_id, order_date, product, price, payment_method) values(1, '2025-04-13', 'Shirts', 132.5, default);
insert into a_orders(order_id, order_date, product, price, payment_method) values(1, '2025-04-13', 'Sneakers', 132.5, default);

-- Update
update a_orders set discount = 10;
select * from a_orders;

-- specific row update
update a_orders set discount  = 20 where order_id = 2;


-- updating primary key
update a_orders set order_id = 3;
update a_orders set product = 'sneakers'; 	-- this will give error because we have combination of primary key so it should be unique
update a_order set product = 'sneakers' where product = 'Shirts';

-- updating 2 columns at a time 
update a_order set product = 'sneakers', payment_method = 'UPI' where product = 'Shirts';






