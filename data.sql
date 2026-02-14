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


show global variables like 'local_infilel';
SET GLOBAL local_infile = 1;  -- Server-side ✓


-- see all the tables 
show tables; 
select * from olist_customers_dataset;






