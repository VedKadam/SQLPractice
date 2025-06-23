-- count function doesnt count null values 

-- View function
-- View can be considered as virtual table  
-- you can drop the view and create a new one just like table
-- we can share the view with others
-- can write any query and just envelope it in a view for data security or low level security 
-- temp table will hold the data and View will just run the query 


create View orders_vw as select * from orders;
select * from orders_vw;

create view order_summary_vw as write_query

create orders_south_vw as select * from orders where region = 'south';
select * from orders_south_vw

create view emp_master as select * from master.dbo.emp;

-- Referencial Intgerity Constraint
-- there should be primary key column in the referrenced table i.e when referring a column from a different table there should be a primary key 
-- when adding primary key, the column should also be not nullable.
-- 

select * from employee;
select * from dept; 

create table emp(
emp_id int not null,
emp_name varchar(10),
dep_id int references dept(dep_id)
);

alter table dept alter column dep_id int not null;			-- added constraint
alter table dept  add constraint primary_keuy as primary key (dep_id);	-- added constraint 

insert into emp values(1, 'Vedant', 100);
insert into emp values(1, 'Dwight', 500);

-- Identity Object 
-- identtity object increments the value automatically.
create table dept1(
id int identity(1, 1),
dep_id int,
dep_name varchar(10)
);











