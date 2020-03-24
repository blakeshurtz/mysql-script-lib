USE SSware;

SELECT customers.email, customers.loc_id, calls.call_date
FROM customers 
JOIN calls
	ON customers.loc_id = calls.loc_id;