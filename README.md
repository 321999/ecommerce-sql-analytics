## the problem statement
This project demonstrates end-to-end SQL analytics and data engineering
using the Brazilian E-Commerce dataset by Olist. It covers schema design,
data quality handling, complex SQL queries, window functions, and
performance optimization.

## Docker container
-- docker stop mysql-container
-- docker rm mysql-container


### schema design 
docker run -d \
--name mysql-container \
-e MYSQL_ROOT_PASSWORD=root123 \
-e MYSQL_DATABASE=testdb \
-p 3306:3306 \
-v mysql_data:/var/lib/mysql \
-v /home/kishore/Desktop/Data:/data \
mysql:8.0

```
mounted folder means whichever comes inside this that can only be laoded
``` 

for quick use we have used the mysql work bench import wizard option which is at tables ke upar and from there select the tables data with their constraint 

18:22:45	LOAD DATA LOCAL INFILE '/data/raw/olist_customers_dataset.csv' INTO TABLE olist_customers_dataset1 FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS	Error Code: 2068. LOAD DATA LOCAL INFILE file request rejected due to restrictions on access.	0.0032 sec

18:26:08	LOAD DATA INFILE '/data/raw/olist_customers_dataset.csv' INTO TABLE olist_customers_dataset1  FIELDS TERMINATED BY ','  ENCLOSED BY '"'  LINES TERMINATED BY '\n'  IGNORE 1 ROWS	Error Code: 1290. The MySQL server is running with the --secure-file-priv option so it cannot execute this statement	0.0014 sec


# Inside container, copy to MySQL's default secure dir
docker exec -it mysql-container bash
mkdir -p /var/lib/mysql-files
cp /data/raw/olist_customers_dataset.csv /var/lib/mysql-files/
exit

