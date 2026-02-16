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
