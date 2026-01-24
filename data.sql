show databases;
use olist;
show tables; 

--  fist we will create the table without using the foreign key 
-- because while raw data uploadation it can be failed or there is high chance of voilating the schema design 
/*
Also we use to create the FK 
in clean,control dataset 
and real time transaction app 
*/

select * from customer;

show tables;
select * from geolocation;
select * from o_payment;
select * from order_item;

-- table for order review 
-- review_id	order_id	review_score	review_comment_title	review_comment_message	review_creation_date	review_answer_timestamp 
create table order_review(
review_id int primary key,
order_id int,
review_score int,
review_title varchar(50),
review_message varchar(200),
review_creation_date date,
review_timestamp timestamp -- reply by the platform or seller on that feedback
) ;


-- table created for oddfer when placed by customer
-- here i thought i created order table but i came to know i have created for order_item 
-- show tables;
-- order_id	customer_id	order_status	order_purchase_timestamp	order_approved_at	order_delivered_carrier_date	order_delivered_customer_date	order_estimated_delivery_date 
create table Order_(
orderId int primary key,
customerId int,
order_placed_at date,
order_status varchar(50),
 orderApproved_at date,
 order_curier date,
 order_recieve date,
 order_estimated date);
 
 
 -- table for the product
 create table product(
 product_id	int primary key,
 product_category_name varchar(100),
 product_name_lenght int ,	
 product_description_lenght int,
 product_photos_qty int ,
 product_weight_g decimal(4,1),
 product_length_cm decimal(4,2),
 product_height_cm decimal(4,2),
 product_width_cm decimal(4,2)
 );
 
 create table seller(
 seller_id int primary key,
 zip_code_prefix int,
 seller_city int ,
 seller_state varchar(20)
 );


create table Category(
category_name varchar(20),
category_name_english varchar(100)
);