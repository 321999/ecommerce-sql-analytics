show databases;
create database olis;
use olis;

-- olist_customers_dataset.csv 
create table olist_customers_dataset1(
customer_id varchar(200),
customer_unique_id varchar(200),
customer_zip_code int,
customer_city varchar(100),
customer_state varchar(100)
);





-- see the tables 
select * from olist_customers_dataset; 


SET GLOBAL local_infile = 1;


LOAD DATA INFILE '/data/raw/olist_customers_dataset.csv'
INTO TABLE olist_customers_dataset1 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS;

-- 18:12:31	LOAD DATA LOCAL INFILE '/data/raw/olist_customers_dataset.csv' INTO TABLE olist_customers_dataset FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS	Error Code: 3948. Loading local data is disabled; this must be enabled on both the client and server sides	0.0041 sec
-- 18:26:08	LOAD DATA INFILE '/data/raw/olist_customers_dataset.csv' INTO TABLE olist_customers_dataset1  FIELDS TERMINATED BY ','  ENCLOSED BY '"'  LINES TERMINATED BY '\n'  IGNORE 1 ROWS	Error Code: 1290. The MySQL server is running with the --secure-file-priv option so it cannot execute this statement	0.0014 sec
SHOW VARIABLES LIKE 'secure_file_priv';

-- 04:21:39	LOAD DATA INFILE '/data/raw/olist_customers_dataset.csv' INTO TABLE olist_customers_dataset1  FIELDS TERMINATED BY ','  ENCLOSED BY '"'  LINES TERMINATED BY '\n'  IGNORE 1 ROWS	Error Code: 1290. The MySQL server is running with the --secure-file-priv option so it cannot execute this statement	0.011 sec
-- secure-file-prev


show global variables like 'local_infile';
SET GLOBAL local_infile = 1;  -- Server-side ✓


-- see all the tables 
show tables; 
select * from olist_customers_dataset;


## know to load the olist geolocation dataset 
-- these are the fields of the table"geolocation_zip_code_prefix","geolocation_lat","geolocation_lng","geolocation_city","geolocation_state"
-- "01037",-23.54562128115268,-46.63929204800168,sao paulo,SP
-- decimal(10,8)  

create table olist_geolocation_dataset1(
	geolocation_zip_code_prefix int,
    geolocation_lat decimal(16,14),
    geolocation_lng decimal(16,14),
    geolocation_city  varchar(100),
    geolocation_state  varchar(100)
);

alter table olist_geolocation_dataset1
modify column geolocation_lat decimal(22,19);

/*
LOAD DATA INFILE '/data/raw/olist_customers_dataset.csv'
INTO TABLE olist_customers_dataset1 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS;
*/

LOAD DATA INFILE '/var/lib/mysql-files/olist_geolocation_dataset.csv'
INTO TABLE olist_geolocation_dataset1 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS;
use olis;

select * from olist_geolocation_dataset1;
truncate olist_geolocation_dataset1;

-- the error "03:43:29	LOAD DATA INFILE '/var/lib/mysql-files/olist_geolocation_dataset.csv' INTO TABLE olist_geolocation_dataset1  FIELDS TERMINATED BY ','  ENCLOSED BY '"'  LINES TERMINATED BY '\n'  IGNORE 1 ROWS	1000163 row(s) affected, 1 warning(s): 1265 Data truncated for column 'geolocation_lat' at row 774623 Records: 1000163  Deleted: 0  Skipped: 0  Warnings: 1	6.442 sec
-- " is ignorable

 


SELECT * FROM olist_geolocation_dataset1 LIMIT 774622, 10;


-- ORDER ITEM load the dataset
-- order_id	order_item_id	product_id	seller_id	shipping_limit_date	price	freight_value
 /*
 order id  is the booking id which is generated when the cusotmer placed the order to track the order from both the side customer as well as from bechne vaale ki side
 order_item_id -- in one order there can be more product orde_tem_id is basically the sequence generated product wise 
 product_id     each product has its own unified id
 seller_id      is to track whose the seller of this0 product basically to know from where the customer has recice the produts 
 shipping_limit_date is the date given by the system to seller to ship the prdouct 
 price -- each product  has its price of the product
 freight_value is th shipping cost like something 
 
select length("00010242fe8c5a6d1ba2dd792cb16214");
select length("4244733e06e7ecb4970a6e2683c13e61");
select length("48436dade18ac8b2bce089ec2a041202");
2017-09-19 09:45:35
-- freight and price both are teh decimal values 

timestamp dataset  yyyy:mm:dd hh:mm:ss
*/
use olis;
create table olist_order_items(
orderid varchar(50),
item_id int,-- product squence in order
product_id varchar(50),
shipping_limit_date timestamp,
price decimal(8,3),
freight_value decimal(5,3)-- delivery charges 
);
-- seller id column has not added 
alter table olist_order_items add column seller_id varchar(50) after product_id;

load data infile '/var/lib/mysql-files/olist_order_items_dataset.csv'
into table olist_order_items
fields terminated by  ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;
select * from olist_order_items;
-- freight value is out of range 
-- changing the datatype of freight value 
alter table olist_order_items 
modify column freight_value decimal(6,3);