## For importing CSV file to tables in our database in PostgreSQL:
- \copy table_name FROM 'path/file.csv' WITH(FORMAT CSV, HEADER true, DELIMITER ',', QUOTE '"') 