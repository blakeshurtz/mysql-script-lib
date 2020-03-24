CREATE TABLE `customers` (
  `billing_acct_id` int PRIMARY KEY,
  `first_name` varchar(255),
  `last_name` varchar(255),
  `address` varchar(255),
  `city` varchar(255),
  `zip` int,
  `date_join` datetime,
  `email` varchar(255),
  `loc_lead_source` varchar(255),
  `loc_lead_source_type` varchar(255)
);

CREATE TABLE `sales_calls` (
  `billing_acct_id` int PRIMARY KEY,
  `call_type` varchar(255),
  `location_id` int,
  `taken_date` datetime,
  `job_lead_source` varchar(255),
  `job_lead_source_type` varchar(255),
  `salesperson` varchar(255),
  `call_date` datetime,
  `call_time` timestamp
);

CREATE TABLE `job_summary` (
  `billing_acct_id` int,
  `job_no` int,
  `end_date` datetime UNIQUE NOT NULL,
  `loc_id` int,
  `job_class` varchar(255) COMMENT 'When order created',
  `job_type` varchar(255),
  `dept` int,
  `job_lead_source` varchar(255),
  `job_lead_source_type` varchar(255),
  PRIMARY KEY (`billing_acct_id`, `job_no`)
);

CREATE TABLE `sales_invoice_items` (
  `billing_acct_id` int,
  `job_no` int,
  `post_date` datetime,
  `item_desciption` varchar(255),
  `hours` float,
  `labor_cost` float,
  `parts_cost` float,
  `misc_cost` float,
  `revenue` float,
  `gross_margin` float,
  PRIMARY KEY (`billing_acct_id`, `job_no`)
);

CREATE TABLE `assignments` (
  `job_no` integer PRIMARY KEY,
  `call_id` int,
  `call_type` varchar(255),
  `tech` varchar(255),
  `dispchd` timestamp,
  `onsite` timestamp,
  `complt` timestamp
);

CREATE TABLE `job_summary_text` (
  `job_no` int PRIMARY KEY,
  `job_instructions` varchar(255),
  `work_completed` varchar(255)
);

ALTER TABLE `sales_calls` ADD FOREIGN KEY (`billing_acct_id`) REFERENCES `job_summary` (`billing_acct_id`);

ALTER TABLE `job_summary` ADD FOREIGN KEY (`billing_acct_id`) REFERENCES `customers` (`billing_acct_id`);

ALTER TABLE `sales_invoice_items` ADD FOREIGN KEY (`billing_acct_id`) REFERENCES `job_summary` (`billing_acct_id`);

ALTER TABLE `sales_invoice_items` ADD FOREIGN KEY (`job_no`) REFERENCES `job_summary` (`job_no`);

ALTER TABLE `assignments` ADD FOREIGN KEY (`job_no`) REFERENCES `job_summary` (`job_no`);

ALTER TABLE `job_summary_text` ADD FOREIGN KEY (`job_no`) REFERENCES `job_summary` (`job_no`);

