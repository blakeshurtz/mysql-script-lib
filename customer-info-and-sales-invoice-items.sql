#table of installs
CREATE TABLE SSware.sii_temp_1
SELECT post_date, loc_id, misc_sale, gross_margin, margin_per, job_type 
FROM SSware.sales_invoice_items_2019_dept_21
WHERE post_date >= "2019-06-01 00:00:00" AND misc_sale > 1000
GROUP BY loc_id
HAVING COUNT(loc_id) = 1;

#table of callbacks
CREATE TABLE SSware.sii_temp_2
SELECT 
	parts_cost + labor_cost + misc_cost AS callback_net_cost,
	hours AS hrs_callback,
	job_type AS job_type_callback,
	loc_id
FROM SSware.sales_invoice_items_2019_dept_21
WHERE post_date >= "2019-06-01 00:00:00" AND job_type in ('CAZCOR', 'FLUP', 'FU-NEW', 'IC', 'INFLUP', 'IN-NW', 'INWAR', 'INWMEQ', 'CB', 'HPCB')
GROUP BY loc_id;

#create table, multi-join
SELECT 
customer_first,
customer_last, 
address,
post_date
job_type,
margin_per *100 AS margin_before,
100*(margin_dol - callback_net_cost)/revenue AS margin_after,
callback_net_cost,
hrs_callback,
job_type_callback
FROM SSware.jc_temp_1
JOIN jc_temp_2
	ON jc_temp_1.loc_id = jc_temp_2.loc_id 
JOIN customers
	ON customers.loc_id = jc_temp_1.loc_id;
    
DROP TABLE SSware.sii_temp_1;
DROP TABLE SSware.sii_temp_2;


