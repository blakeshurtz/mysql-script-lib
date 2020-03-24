d <- rbind(dept_20_01_20, dept_21_01_20, dept_22_01_20, dept_30_01_20,
      dept_45_01_20, dept_50_01_20, dept_55_01_20)

#adding column names
colnames(d) <- c("job_no",
                 "end_date",
                 "loc_id",	
                 "job_class",	
                 "job_type",	
                 "dep",
                 "tech",
                 "bill_acct_id",
                 "hrs",
                 "revenue",
                 "cost",
                 "margin_dol",
                 "margin_per",
                 "address_1",
                 "address_2",
                 "lab_cost",
                 "lab_per",
                 "parts_cost",
                 "parts_per",
                 "misc_cost",
                 "perc_misc")

#clean data
library(lubridate)
d$end_date <- mdy(d$end_date)
#convert revenue variable from character to numeric
library(stringr)
d$revenue <- str_replace(d$revenue, "[$]", ""); head(d$revenue)
d$revenue <- str_replace(d$revenue, "[,]", ""); head(d$revenue)
d$revenue <- as.numeric(d$revenue)
d$revenue <- ifelse(is.na(d$revenue), 0, d$revenue)
#convert cost variable from character to numeric
d$cost <- str_replace(d$cost, "[$]", ""); head(d$cost)
d$cost <- str_replace(d$cost, "[,]", ""); head(d$cost)
d$cost <- as.numeric(d$cost)
d$cost <- ifelse(is.na(d$cost), 0, d$cost)
#convert margin_dol variable from character to numeric
d$margin_dol <- str_replace(d$margin_dol, "[$]", ""); head(d$margin_dol)
d$margin_dol <- str_replace(d$margin_dol, "[,]", ""); head(d$margin_dol)
d$margin_dol <- as.numeric(d$margin_dol)
d$margin_dol <- ifelse(is.na(d$margin_dol), 0, d$margin_dol)
#convert margin_per variable from character to numeric
d$margin_per <- str_replace(d$margin_per, "[%]", ""); head(d$margin_per)
d$margin_per <- as.numeric(d$margin_per)
d$margin_per <- d$margin_per/100
d$margin_per <- ifelse(is.na(d$margin_per), 0, d$margin_per)
#convert lab_cost from character to numeric
d$lab_cost <- str_replace(d$lab_cost, "[$]", ""); head(d$lab_cost)
d$lab_cost <- str_replace(d$lab_cost, "[,]", ""); head(d$lab_cost)
d$lab_cost <- as.numeric(d$lab_cost)
d$lab_cost <- ifelse(is.na(d$lab_cost), 0, d$lab_cost)
#convert lab_per from character to numeric
d$lab_per <- str_replace(d$lab_per, "[%]", ""); head(d$lab_per)
d$lab_per <- as.numeric(d$lab_per)
d$lab_per <- d$lab_per/100
d$lab_per <- ifelse(is.na(d$lab_per), 0, d$lab_per)
#convert parts_cost from character to numeric
d$parts_cost <- str_replace(d$parts_cost, "[$]", ""); head(d$parts_cost)
d$parts_cost <- str_replace(d$parts_cost, "[,]", ""); head(d$parts_cost)
d$parts_cost <- as.numeric(d$parts_cost)
d$parts_cost <- ifelse(is.na(d$parts_cost), 0, d$parts_cost)
#convert parts_per from character to numeric
d$parts_per <- str_replace(d$parts_per, "[%]", ""); head(d$parts_per)
d$parts_per <- as.numeric(d$parts_per)
d$parts_per <- d$parts_per/100
d$parts_per <- ifelse(is.na(d$parts_per), 0, d$parts_per)
#convert misc_cost from character to numeric
d$misc_cost <- str_replace(d$misc_cost, "[(]", "-"); head(d$misc_cost) #convert left parenthesis to negative sign
d$misc_cost <- str_replace(d$misc_cost, "[)]", ""); head(d$misc_cost) #convert left parenthesis to negative sign
d$misc_cost <- str_replace(d$misc_cost, "[$]", ""); head(d$misc_cost)
d$misc_cost <- str_replace(d$misc_cost, "[,]", ""); head(d$misc_cost)
d$misc_cost <- as.numeric(d$misc_cost)
d$misc_cost <- ifelse(is.na(d$misc_cost), 0, d$misc_cost)
#convert perc_misc from character to numeric
d$perc_misc <- str_replace(d$perc_misc, "[%]", ""); head(d$perc_misc)
d$perc_misc <- as.numeric(d$perc_misc)
d$perc_misc <- d$perc_misc/100
d$perc_misc <- ifelse(is.na(d$perc_misc), 0, d$perc_misc)

#Departments 20, 21, 22, 30, 45, 50, 55
library(tidyverse)
d <- d %>% filter(dep %in% c(20, 21, 22, 30, 45, 50, 55))

#check for row duplicates
sum(duplicated(d))
#don't forget to set wd
write.csv(d, "JCA_01_2020.csv", row.names = FALSE)
###don't forget to delete the index variable!