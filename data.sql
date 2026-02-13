show databases;
create database olis;
use olis;

-- olist_customers_dataset.csv 
create table olist_customers_dataset(
customer_id varchar(200),
customer_unique_id varchar(200),
customer_zip_code int,
customer_city varchar(100),
customer_state varchar(100)
);
-- see the tables 
select * from olist_customers_dataset; 


SET GLOBAL local_infile = 1;


LOAD DATA LOCAL INFILE
'/data/data_engineering_asg1/ecommerce-sql-analytics/data/raw/olist_customers_dataset.csv'
INTO TABLE olist_customers_dataset
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;




