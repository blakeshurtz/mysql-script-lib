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