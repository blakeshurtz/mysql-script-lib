-- join calls and installs
SELECT *  -- specify from either table
FROM calls
JOIN job_cost
ON  calls.loc_id = job_cost.loc_id;

-- join multiple tables
USE SSware;

SELECT calls.loc_id, job_cost.end_date, job_cost.job_type, job_cost.revenue
FROM customers 
JOIN calls
	ON customers.loc_id = calls.loc_id
JOIN job_cost
	ON calls.loc_id = job_cost.loc_id
WHERE revenue > 0