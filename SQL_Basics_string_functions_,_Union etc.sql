-- string functions, Null Handling Functions

-- NOTE : 
--		-> replace function will require entire string where as translate function will replace letter by letter
--		-> translate can replace any speacial charater or numbers etc.
--		-> trim function can be used in where clause 


--len function(length) ==> counts character in a string, it only counts the leading space and do not support trailing spaces.
select Order_ID, Customer_Name, len(customer_name) as len_name, len(' Claire Gute')  from orders;

-- left function ==> will give first n characters 
select Order_ID, Customer_Name, len(customer_name) as len_name, left(Customer_Name, 4) as name_4 from orders;

-- right function ==> will give last n characters
select Order_ID, Customer_Name, len(customer_name) as len_name, right(Customer_Name, 5) as name_4 from orders;

-- substring function 
-- => pass 3 arguments in this 
--		-> column_name, 
--		-> from which character you need to pick the string 
--		-> how many characters you need to pick 

select Order_ID, Customer_Name,
len(customer_name) as len_name,
right(Customer_Name, 5) as name_4 ,
SUBSTRING(Customer_Name, 4, 5) as subStr45,
SUBSTRING(Order_ID, 4, 4) as Year_from_Order_ID
from orders;

-- CharIndex ==> gives the character index 
-- pass character and column_name and from which position to look for(optional)

select Order_ID, Customer_Name,
len(customer_name) as len_name,
right(Customer_Name, 5) as name_4 ,
SUBSTRING(Customer_Name, 4, 5) as subStr45,
SUBSTRING(Order_ID, 4, 4) as Year_from_Order_ID,
CHARINDEX(' ', Customer_Name) as space_position,
CHARINDEX('n', Customer_Name) as space_position_n,
CHARINDEX('n', Customer_Name, 1) as n_position,
CHARINDEX('n', Customer_Name, 5) as n_position,
CHARINDEX('n', Customer_Name, 11) as n_position
from orders;

-- Concat ==> concat multiple string or multiple columns together

select Order_ID, Customer_Name,
len(customer_name) as len_name,
right(Customer_Name, 5) as name_4 ,
SUBSTRING(Customer_Name, 4, 5) as subStr45,
SUBSTRING(Order_ID, 4, 4) as Year_from_Order_ID,
CHARINDEX(' ', Customer_Name) as space_position,
CHARINDEX('n', Customer_Name) as space_position_n,
CONCAT(order_id, Customer_Name) as concatenated_column,
CONCAT(order_id,' ', Customer_Name) as concatenated_column_with_space
from orders;

-- + function, instead of using concat we can directly use +

select Order_ID, Customer_Name,
len(customer_name) as len_name,
right(Customer_Name, 5) as name_4 ,
SUBSTRING(Customer_Name, 4, 5) as subStr45,
SUBSTRING(Order_ID, 4, 4) as Year_from_Order_ID,
CHARINDEX(' ', Customer_Name) as space_position,
CHARINDEX('n', Customer_Name) as space_position_n,
CONCAT(order_id, Customer_Name) as concatenated_column,
Order_ID+' - ' +Customer_Name
from orders;

--using left and right function
select Order_ID, Customer_Name,
len(customer_name) as len_name,
left(customer_name, 4) as name_4,
right(Customer_Name, 5) as name_5 ,
--SUBSTRING(Customer_Name, 4, 5) as subStr45,
--SUBSTRING(Order_ID, 4, 4) as Year_from_Order_ID,
LEFT(customer_name, Charindex(' ', customer_name)) as first_name,
CHARINDEX(' ', Customer_Name) as space_position,
CHARINDEX('n', Customer_Name) as space_position_n,
CONCAT(order_id, Customer_Name) as concatenated_column,
Order_ID+' - ' +Customer_Name
from orders;

-- Replace Function
-- can replace substring from a string 

select Order_ID, Customer_Name,
REPLACE(order_id, 'CA', 'PB') as replace_CA,
REPLACE(Customer_Name, 'A', 'Z') as replace_a_to_z,
len(customer_name) as len_name,
left(customer_name, 4) as name_4,
right(Customer_Name, 5) as name_5 ,
--SUBSTRING(Customer_Name, 4, 5) as subStr45,
--SUBSTRING(Order_ID, 4, 4) as Year_from_Order_ID,
LEFT(customer_name, Charindex(' ', customer_name)) as first_name,
CHARINDEX(' ', Customer_Name) as space_position,
CHARINDEX('n', Customer_Name) as space_position_n,
CONCAT(order_id, Customer_Name) as concatenated_column,
Order_ID+' - ' +Customer_Name
from orders;

-- Translate function 
-- in below example translate function will convert A to T and G to P and C to L

select Order_ID, Customer_Name,
REPLACE(order_id, 'CA', 'PB') as replace_CA,
REPLACE(Customer_Name, 'A', 'Z') as replace_a_to_z,
TRANSLATE(Customer_Name, 'AGC', 'TPL') as translate_AG_TA,
len(customer_name) as len_name,
left(customer_name, 4) as name_4,
right(Customer_Name, 5) as name_5 ,
--SUBSTRING(Customer_Name, 4, 5) as subStr45,
--SUBSTRING(Order_ID, 4, 4) as Year_from_Order_ID,
LEFT(customer_name, Charindex(' ', customer_name)) as first_name,
CHARINDEX(' ', Customer_Name) as space_position,
CHARINDEX('n', Customer_Name) as space_position_n,
CONCAT(order_id, Customer_Name) as concatenated_column,
Order_ID+' - ' +Customer_Name
from orders;

-- reverse function

select Order_ID, Customer_Name,
REVERSE(Customer_Name) as rev,
REPLACE(order_id, 'CA', 'PB') as replace_CA,
REPLACE(Customer_Name, 'A', 'Z') as replace_a_to_z,
TRANSLATE(Customer_Name, 'AGC', 'TPL') as translate_AG_TA,
len(customer_name) as len_name,
left(customer_name, 4) as name_4,
right(Customer_Name, 5) as name_5 ,
--SUBSTRING(Customer_Name, 4, 5) as subStr45,
--SUBSTRING(Order_ID, 4, 4) as Year_from_Order_ID,
LEFT(customer_name, Charindex(' ', customer_name)) as first_name,
CHARINDEX(' ', Customer_Name) as space_position,
CHARINDEX('n', Customer_Name) as space_position_n,
CONCAT(order_id, Customer_Name) as concatenated_column,
Order_ID+' - ' +Customer_Name
from orders;

-- Trim function will trim leading and trailing spaces from the string

select Order_ID, Customer_Name,
TRIM(' vedant '),
REVERSE(Customer_Name) as rev,
REPLACE(order_id, 'CA', 'PB') as replace_CA,
REPLACE(Customer_Name, 'A', 'Z') as replace_a_to_z,
TRANSLATE(Customer_Name, 'AGC', 'TPL') as translate_AG_TA,
len(customer_name) as len_name,
left(customer_name, 4) as name_4,
right(Customer_Name, 5) as name_5 ,
--SUBSTRING(Customer_Name, 4, 5) as subStr45,
--SUBSTRING(Order_ID, 4, 4) as Year_from_Order_ID,
LEFT(customer_name, Charindex(' ', customer_name)) as first_name,
CHARINDEX(' ', Customer_Name) as space_position,
CHARINDEX('n', Customer_Name) as space_position_n,
CONCAT(order_id, Customer_Name) as concatenated_column,
Order_ID+' - ' +Customer_Name
from orders;

-- Null Handling Functions
-- first argument is column_name/string on which you want to replace and second is replace_value
select Order_ID, City, ISNULL(City, 'unknown') as new_city from orders order by city where city is null;

-- Coalesce function
-- similar to isnull function
-- in below example if city is null then check for state and if state is null it ll check region, and then it will give default valeu 'unknown'
-- can be used instead of is null function
select Order_ID, City, ISNULL(City, 'unknown') as new_city, COALESCE(city,state,region, 'unknown') as neww_city from orders order by city;

-- CAST Function (numerical function)
--		-> The CAST() function converts a value (of any type) into a specified datatype.

select top 5 order_id, sales, cast(sales as int) as sales_int,
ROUND(sales, 1) as round_Sales
from Orders;

-- SET Queries
--		--> union all ==> combine data row wise of multiple table, datataype and number of culms shoule be same in both the select statements
--		--> union ==> will remove the duplicates

create table orders_west(
order_id int,
region varchar(10),
sales int
);

create table orders_east(
order_id int,
region varchar(10),
sales int
);

insert into orders_west values(1, 'west', 100), (2, 'west', 200);
insert into orders_east values(3, 'east', 100), (4, 'east', 300);
insert into orders_west values(3, 'east', 100);
insert into orders_west values(3, 'west', 100);


select * from orders_west union all select * from orders_east;

-- Union
--		--> will remove the duplicates

select * from orders_west union select * from orders_east;

-- intersect 
--		--> removes duplicates and gives the common records
--		--> can do in will all or respective columns
select * from orders_west intersect select * from orders_east;
select order_id, sales from orders_east intersect select order_id, sales from orders_west;

-- except
--		--> The SQL EXCEPT operator is used to return the rows from the first SELECT statement that are not present in the second SELECT statement. This operator is conceptually similar to the subtract operator in relational algebra. It is particularly useful for excluding specific data from your result set.
--		--> will remove duplicates 

select order_id, sales from orders_east except select order_id, sales from orders_west;
select order_id, sales from orders_west except select order_id, sales from orders_east;

(select * from orders_east except select * from orders_west) union all(
select * from orders_west except select * from orders_east);

	



