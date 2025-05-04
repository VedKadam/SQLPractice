-- index: 
	-- joins ==> inner, left, cross

-- NOTE : 
	-- default is inner join
	-- To read data with multiple tables we have database joins


-- database joins
select o.order_id, o.order_date, r.return_reason
from orders o
inner join returns r on o.order_id = r.order_id;

select o.order_id, o.product_id, o.order_date, r.return_reason
from orders o
inner join returns r on o.order_id = r.order_id;


-- left join 
-- ==> if there is no match it will return null
-- ==> returns all the records from the left table and matching data from the right table will be available in the output and if not then it will be null

select o.order_id, o.product_id, o.order_date, r.return_reason
from orders o
left join returns r on o.order_id = r.order_id;


-- orders which have never been returned or are null 
select o.order_id, o.product_id, o.order_date, r.return_reason
from orders o								-- 1
left join returns r on o.order_id = r.order_id				-- 2
where r.order_id is null;						-- 3

select o.order_id, o.product_id, o.order_date, r.return_reason
from orders o								-- 1
left join returns r on o.order_id = r.order_id				-- 2
where r.return_reason is null;						-- 3


-- how many sales lost
-- grouup by can be done on tables of left table or right table or combination of left and right tables
select r.return_reason, sum(sales) as total_sales
from orders o							
left join returns r on o.order_id = r.order_id				
group by r.return_reason;

select r.return_reason, sum(sales) as total_sales
from orders o							
inner join returns r on o.order_id = r.order_id				
group by r.return_reason;


-- cross join
select * from employee ;
select * from dept;

-- if we are not giving any join condition every record of one table will join with every record of another table.
select * from employee, dept order by employee.emp_id;
-- another way of doing this 
-- 1=1 or 100 = 100 will always be true
select * from employee inner join dept on 1=1 order by employee.emp_id;

select * from employee e inner join dept d on e.dept_id = d.dept_id;
select e.emp_id, e.emp_name, d.dept_id, d.dept_name from employee e inner join dept d on e.dept_id = d.dept_id;
select e.emp_id, e.emp_name, d.dept_id, d.dept_name from employee e left join dept d on e.dept_id = d.dept_id;


-- right join
-- reverse of left join
-- i will get everything from the right table and matching data from the left table and whatever information is not present will get null.
select e.emp_id, e.emp_name, d.dept_id, d.dept_name from employee e right join dept d on e.dept_id = d.dept_id;
select e.emp_id, e.emp_name, d.dept_id, d.dept_name from dept d left join employee e on e.dept_id = d.dept_id;

-- full outer join
-- everythig will come from both the tables and unmatching data will return null
select e.emp_id, e.emp_name, d.dept_id, d.dept_name from dept d full outer join employee e on e.dept_id = d.dept_id;

create table people(
manager VARCHAR(20),
region VARCHAR(20)
);

insert into people VALUES ('Jake Peralta', 'East'), ('Michael Scott', 'West'), ('Leonerd Hofstader', 'North'), ('Ted Mosby', 'South');

select * from people;
 
select o.order_id, o.product_id, r.return_reason, p.manager
from orders o 
inner join returns r on o.order_id = r.order_id
inner join people p on p.region = o. region

  




















