USE SSware;

CREATE TABLE A
SELECT call_date, call_type, customer_last, customer_first, loc_id, email, salesperson 
FROM calls
WHERE taken_date > '2019-01-01' 
	AND call_type IN ('EHA', 'EWH', 'EDW', 'ESOL', 'EINS', 'EMISC') 
    AND email NOT IN ('NA', 'invoices@ghac.com', '');

CREATE TABLE B
SELECT loc_id, end_date, revenue 
FROM job_cost_analysis
WHERE revenue > 1000 AND end_date > '2019-01-01';

SELECT * FROM A
LEFT OUTER JOIN B 
ON A.loc_id = B.loc_id
WHERE B.loc_id IS NULL
GROUP BY A.loc_id;

DROP TABLE SSware.A;
DROP TABLE SSware.B;