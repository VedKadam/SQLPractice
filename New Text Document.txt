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