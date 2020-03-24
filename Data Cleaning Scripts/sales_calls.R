#import data
d <- calls_12_2019

#add names- 39 variables
colnames(d) <- c("call_id", "call_type", "loc_id", "blank_1", "taken_date", 
                 "dept", "source_type",  "source", "salesperson", "city", 
                 "pri", "call_date", "notes", "job_class", "job_no",
                  "call_time", "phone_1", "phone_2", "taken_by", "status", 
                 "unknown_1", "sched_by", "inv_no", "blank_2", "email", 
                 "blank_3", "customer_first", "customer_last", "address", "blank_4", 
                 "city_2", "state", "zip", "salesperson_2", "customer_since_date", 
                 "company_name", "blank_5", "comp_always", "unknown_2")

library(dplyr)

d <- d %>% select(call_id, call_type, loc_id, taken_date, dept, source_type, source, salesperson,
             city, call_date, job_class, call_time, inv_no, email, customer_first, customer_last, address, zip)
#clean data
library(lubridate)
d$taken_date <- mdy(d$taken_date)
d$call_date <- mdy(d$call_date)


write.csv(d, "calls_12_2019.csv", row.names = FALSE)
