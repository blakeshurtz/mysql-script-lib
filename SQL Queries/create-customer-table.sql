CREATE TABLE calls_backup SELECT * FROM calls;
-- INSERT calls_backup SELECT * FROM calls #creates duplictes

#recreate customers table- delete existing
CREATE TABLE customers AS
SELECT * FROM calls;

# run each query seperately
ALTER TABLE customers
  DROP COLUMN call_id,
  DROP COLUMN call_type,
  DROP COLUMN blank_1,
  DROP COLUMN taken_date,
  DROP COLUMN dept,
  DROP COLUMN source,
  DROP COLUMN unknown_1,
  DROP COLUMN phone_2,
  DROP COLUMN source_type,
  DROP COLUMN salesperson,
  DROP COLUMN pri,
  DROP COLUMN call_date,
  DROP COLUMN notes,
  DROP COLUMN job_class,
  DROP COLUMN job_no, 
  DROP COLUMN call_time,
  DROP COLUMN taken_by,
  DROP COLUMN status,
  DROP COLUMN unknown_2,
  DROP COLUMN sched_by,
  DROP COLUMN blank_2,
  DROP COLUMN inv_no,
  DROP COLUMN blank_3,
  DROP COLUMN blank_4,
  DROP COLUMN blank_5,
  DROP COLUMN city_2,
  DROP COLUMN salesperson_2,
  DROP COLUMN customer_since_date,
  DROP COLUMN company_name,
  DROP COLUMN comp_always;
  
CREATE TABLE customers_copy LIKE customers;

INSERT INTO customers_copy
SELECT * FROM customers
GROUP BY address; -- column that has duplicate values

DROP TABLE customers;
ALTER TABLE customers_copy RENAME TO customers;

select * from customers;
-- verify delete
SELECT 
    address, 
    COUNT(address)
FROM
    customers
GROUP BY 
    address
HAVING 
    COUNT(address) > 1;
    
#drop calls_backup
  