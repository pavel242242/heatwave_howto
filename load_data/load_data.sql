USE keboola;
SET @db_list = '["keboola"]';
SET @dl_tables = '[{
"db_name": "keboola",
"tables": [{
    "table_name": "CUSTOMER",
    "dialect": 
       {
       "format": "csv",
       "field_delimiter": ",",
       "record_delimiter": "\\n",
       "has_header": true
       },
    "file": [{"par": "https://objectstorage.eu-frankfurt-1.oraclecloud.com/p/avQOMZXfWatLvB6X-L88mlDNa3a5HduOOn-Ec0zUIBDaO6BSsScDGsep5CXgPCBF/n/frx6pux5wrxh/b/bucket-20240610-1008/o/CUSTOMER.csv"}]
},{
    "table_name": "LINEITEM",
    "dialect": 
       {
       "format": "csv",
       "field_delimiter": ",",
       "record_delimiter": "\\n",
       "has_header": true
       },
    "file": [{"par": "https://objectstorage.eu-frankfurt-1.oraclecloud.com/p/kZ5ICKcAu0Db-bhlIm3HsIyZr1-3EN6nwh8g9_SvPRoH7vG-oSRYNWTbvqznKqZy/n/frx6pux5wrxh/b/bucket-20240610-1008/o/LINEITEM.csv"}]
},{
    "table_name": "NATION",
    "dialect": 
       {
       "format": "csv",
       "field_delimiter": ",",
       "record_delimiter": "\\n",
       "has_header": true
       },
    "file": [{"par": "https://objectstorage.eu-frankfurt-1.oraclecloud.com/p/ddDFfQSSxNcel1idpszvAORZ1U93I2rpQlwV_ctA4agUyr3VlKGIsM8-mhYwuWC-/n/frx6pux5wrxh/b/bucket-20240610-1008/o/NATION.csv"}]
},{
    "table_name": "ORDERS",
    "dialect": 
       {
       "format": "csv",
       "field_delimiter": ",",
       "record_delimiter": "\\n",
       "has_header": true
       },
    "file": [{"par": "https://objectstorage.eu-frankfurt-1.oraclecloud.com/p/9Leh3pRh9oiwBy8Q9xM7RGa4aHH1Tgkn9F_luNEuXzIjJ3c-CJILqzl2LEc7TxFH/n/frx6pux5wrxh/b/bucket-20240610-1008/o/ORDERS.csv"}]
},
{
    "table_name": "PART",
    "dialect": 
       {
       "format": "csv",
       "field_delimiter": ",",
       "record_delimiter": "\\n",
       "has_header": true
       },
    "file": [{"par": "https://objectstorage.eu-frankfurt-1.oraclecloud.com/p/rTtMl-zH77qBZYxiEc7eRPjIWuEiQicg38G-nRfAZ6L4vpSL_4qz8tqL5yC8yFsg/n/frx6pux5wrxh/b/bucket-20240610-1008/o/PART.csv"}]
},
{
    "table_name": "PARTSUPP",
    "dialect": 
       {
       "format": "csv",
       "field_delimiter": ",",
       "record_delimiter": "\\n",
       "has_header": true
       },
    "file": [{"par": "https://objectstorage.eu-frankfurt-1.oraclecloud.com/p/Z5VFUSSsGHzU7rMxBYJdDhWjzNyRVLD9xATpNaPvmTM2tD1z9yaNdXlFUAQfCw5D/n/frx6pux5wrxh/b/bucket-20240610-1008/o/PARTSUPP_c.csv"}]
},
{
    "table_name": "REGION",
    "dialect": 
       {
       "format": "csv",
       "field_delimiter": ",",
       "record_delimiter": "\\n",
       "has_header": true
       },
    "file": [{"par": "https://objectstorage.eu-frankfurt-1.oraclecloud.com/p/XueoV9gdq-x6fL-jpOZEJUuYsGjAqKohHsQJUouj1BekPa6EbQ4ZhSzKakNjascf/n/frx6pux5wrxh/b/bucket-20240610-1008/o/REGION.csv"}]
},
{
    "table_name": "SUPPLIER",
    "dialect": 
       {
       "format": "csv",
       "field_delimiter": ",",
       "record_delimiter": "\\n",
       "has_header": true
       },
    "file": [{"par": "https://objectstorage.eu-frankfurt-1.oraclecloud.com/p/v-6HTuEaOw4Jogn7WDHDPt2wejIDc_x2SviPfSWvynbdpHuX1KyXiFHhquCZEZGk/n/frx6pux5wrxh/b/bucket-20240610-1008/o/SUPPLIER.csv"}]
}
] }]';

SET @options = JSON_OBJECT('mode', 'dry_run',  'policy', 'disable_unsupported_columns',  'external_tables', CAST(@dl_tables AS JSON));
CALL sys.heatwave_load(@db_list, @options);

SET @options = JSON_OBJECT('mode', 'normal',  'policy', 'disable_unsupported_columns',  'external_tables', CAST(@dl_tables AS JSON));
CALL sys.heatwave_load(@db_list, @options);


ORDERS - https://objectstorage.eu-frankfurt-1.oraclecloud.com/p/9Leh3pRh9oiwBy8Q9xM7RGa4aHH1Tgkn9F_luNEuXzIjJ3c-CJILqzl2LEc7TxFH/n/frx6pux5wrxh/b/bucket-20240610-1008/o/ORDERS.csv
PART - https://objectstorage.eu-frankfurt-1.oraclecloud.com/p/rTtMl-zH77qBZYxiEc7eRPjIWuEiQicg38G-nRfAZ6L4vpSL_4qz8tqL5yC8yFsg/n/frx6pux5wrxh/b/bucket-20240610-1008/o/PART.csv
PARTSUPP - https://objectstorage.eu-frankfurt-1.oraclecloud.com/p/Z5VFUSSsGHzU7rMxBYJdDhWjzNyRVLD9xATpNaPvmTM2tD1z9yaNdXlFUAQfCw5D/n/frx6pux5wrxh/b/bucket-20240610-1008/o/PARTSUPP_c.csv

--LINEITEM
--https://objectstorage.eu-frankfurt-1.oraclecloud.com/p/H3UgoLVLUY9p1_IILU7EHcAHF1TnclrUf7PyoRSytn5j0Cr1QmawZqmQu8ZXS3UN/n/frx6pux5wrxh/b/bucket-20240610-1008/o/LINEITEM.csv

CREATE TABLE `chocho`.`nation`( `N_NATIONKEY` tinyint unsigned NOT NULL, `N_NAME` varchar(14) NOT NULL COMMENT 'RAPID_COLUMN=ENCODING=VARLEN', `N_REGIONKEY` tinyint unsigned NOT NULL, `N_COMMENT` varchar(114) NOT NULL COMMENT 'RAPID_COLUMN=ENCODING=VARLEN') ENGINE=lakehouse SECONDARY_ENGINE=RAPID ENGINE_ATTRIBUTE='{"file": [{"par": "https://objectstorage.eu-frankfurt-1.oraclecloud.com/p/elqJ4yOBb1QcO1vtwJgl0kh1PRwN2JtqJcZ6FKgYS6GGf8pKt5pjzaW9rM1GwmoS/n/idazzjlcjqzj/b/lakehouse-files/o/NATION.csv"}], "dialect": {"format": "csv", "has_header": true, "field_delimiter": ",", "record_delimiter": "\\n"}}'; |
ALTER TABLE /*+ AUTOPILOT_DISABLE_CHECK */ `chocho`.`nation` SECONDARY_LOAD;

https://objectstorage.eu-frankfurt-1.oraclecloud.com/p/Eo8-KpSqMuPEDgJ0aQ8hQyzndDB7yIb-SqlrUC0-61ddMFk5SYpQ5_di19g6Bew7/n/frx6pux5wrxh/b/bucket-20240610-1008/o/CUSTOMER.csv
https://objectstorage.eu-frankfurt-1.oraclecloud.com/p/32ETcB9V_KI2soYWSLk1OiQaekie_oqGtaYM7Wbma9mELZjYHpwA_LHNKzKTmRMx/n/frx6pux5wrxh/b/bucket-20240610-1008/o/SUPPLIER.csv

SET @dl_tables = '[{
"db_name": "chocho",
"tables": [{
    "table_name": "supplier",
    "dialect": 
       {
       "format": "csv",
       "field_delimiter": ",",
       "record_delimiter": "\\n",
       "has_header": true
       },
    "file": [{"par": "https://objectstorage.eu-frankfurt-1.oraclecloud.com/p/32ETcB9V_KI2soYWSLk1OiQaekie_oqGtaYM7Wbma9mELZjYHpwA_LHNKzKTmRMx/n/frx6pux5wrxh/b/bucket-20240610-1008/o/SUPPLIER.csv"}]
}] }]';
