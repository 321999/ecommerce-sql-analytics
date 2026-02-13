ecommerce-sql-analytics/
│
├── README.md
│
├── data/
│   └── raw/                 # Original CSVs (or link only)
│
├── erd/
│   └── ecommerce_erd.png
│
├── sql/
│   ├── 01_schema/
│   │   ├── create_tables.sql
│   │   └── constraints.sql
│   │
│   ├── 02_data_cleaning/
│   │   ├── detect_duplicates.sql
│   │   ├── orphan_records.sql
│   │   └── data_fixes.sql
│   │
│   ├── 03_queries/
│   │   ├── aggregations.sql
│   │   ├── joins.sql
│   │   ├── window_functions.sql
│   │   └── ctes_subqueries.sql
│   │
│   └── 04_optimization/
│       ├── explain_before.sql
│       ├── indexes.sql
│       └── explain_after.sql
│
├── reports/
│   ├── data_quality.md
│   └── performance_optimization.md
│
└── video/
    └── walkthrough_link.txt


-- many times i got the error as the data can be only loaded from secure_file_prev option 

so what i have done is that transfered all my data to dcoker container to mysql accessible file location 
docker cp /home/kishore/Desktop/Data/data_engineering_asg1/ecommerce-sql-analytics/data/raw/. mysql-container:/var/lib/mysql-files/

