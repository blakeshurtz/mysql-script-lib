library(here)
library(tidyverse)
library(stringr)
library(lubridate)

d <- rbind(dept_20_01_20, dept_21_01_20, dept_22_01_20, dept_30_01_20, dept_45_01_20, dept_50_01_20)

#adding column names
colnames(d) <- c("inv_date",
                 "post_date",
                 "bill_acct_id",
                 "loc_id",
                 "sales_rep",
                 "sale_type",
                 "qty",
                 "item_code",
                 "item_description",
                 "discount",
                 "amt_after_discount",
                 "inv_type",
                 "job_no",
                 "is_blank",
                 "claim_no",
                 "tech",
                 "job_type",	
                 "dep",
                 "job_lead_source",
                 "job_lead_source_type",
                 "loc_lead_source",
                 "loc_lead_source_type",
                 "reporting_job_class",
                 "contract_no",
                 "std_hours_per_unit",
                 "std_hours_extended",
                 "revised_std",
                 "actual_hours",
                 "hours",
                 "parts_sale",
                 "parts_cost",
                 "parts_per",
                 "labor_sale",
                 "labor_cost",
                 "labor_per",
                 "misc_sale",
                 "misc_cost",
                 "misc_per",
                 "gross_margin",
                 "margin_per"
                  )

d <- d %>% select(post_date, bill_acct_id, loc_id,
             sales_rep, item_description, job_no,
             job_type, dep, 
             job_lead_source, job_lead_source_type,
             loc_lead_source, loc_lead_source_type,
             parts_cost, parts_per,
             hours, labor_cost, labor_per,
             misc_cost, misc_per, 
             misc_sale, gross_margin, margin_per) %>% 
      mutate(post_date = mdy(post_date),
             sales_rep = as.character(sales_rep),
             item_description = as.character(item_description),
             job_type = as.character(job_type),
             job_lead_source = as.character(job_lead_source),
             job_lead_source_type = as.character(job_lead_source_type),
             loc_lead_source = as.character(loc_lead_source),
             loc_lead_source_type = as.character(loc_lead_source_type),
             parts_cost = str_replace_all(parts_cost, "[$|,|)]", ""),
             parts_cost = as.numeric(str_replace_all(parts_cost, "[(]", "-")),
             parts_per = as.numeric(str_replace(parts_per, "[%]", ""))/100,
             hours = str_replace_all(hours, "[(]", "-"),
             hours = str_replace_all(hours, "[)]", ""),
             hours = as.numeric(as.character(hours)),
             labor_cost = as.numeric(str_replace_all(labor_cost, "[$,]", "")),
             labor_per = as.numeric(str_replace(labor_per, "[%]", ""))/100,
             misc_cost = as.numeric(str_replace_all(misc_cost, "[$,]", "")),
             misc_per = as.numeric(str_replace(misc_per, "[%]", ""))/100,
             misc_sale = str_replace_all(misc_sale, "[$|,|)]", ""),
             misc_sale = as.numeric(str_replace_all(misc_sale, "[(]", "-")),
             gross_margin = str_replace_all(gross_margin, "[$|,|)]", ""),
             gross_margin = as.numeric(str_replace_all(gross_margin, "[(]", "-")),
             margin_per = as.numeric(str_replace(margin_per, "[%]", ""))/100) %>%  
      filter(job_type != "") 


#check for row duplicates
sum(duplicated(d))

#remove duplicates
d <- d[!duplicated(d), ]

#don't forget to set wd
write.csv(d, "sii_01_20.csv", row.names = FALSE)
