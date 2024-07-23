1. get private key from prod RD vault
2. ssh to vm in oracle cloud
   `ssh opc@130.61.120.121 -i Documents/ssh-key-ch.key`
3. run mysqlsh to connect to heatwave
   `mysqlsh jordanrburger@10.0.1.118 --sql`
4. loading data (load_data/)

- set variables

```
-- target db (schema)
SET @db_list = '["keboola"]';
-- table to be loaded options
SET @dl_tables = .. table definition
-- load options
SET @options = JSON_OBJECT('mode', 'dry_run',  'policy', 'disable_unsupported_columns',  'external_tables', CAST(@dl_tables AS JSON));
```

5. load
   `CALL sys.heatwave_load(@db_list, @options);`
