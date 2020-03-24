library(dplyr)
#importing original data

d <- assignments_01_20
d <- d %>% dplyr::select(c("V1", "V2", "V3", "V5", "V6", "V7", "V8", "V11", "V12", "V18", "V19", "V21", "V22", "V24"))

#adding column names
colnames(d) <- c("call_id",
                 "call_type",
                 "tech",	
                 "dispchd",	
                 "onsite",
                 "complt",
                 "jobno",
                 "name",
                 "address",
                 "job_class",
                 "taken_date",
                 "sched_date",
                 "sched_time",
                 "est_duration"
                 )

#clean dates
library(lubridate)
head(d$sched_date)
d$taken_date <- mdy(d$taken_date)
d$sched_date <- mdy(d$sched_date)
#clean times
#d$sched_time
head(d$sched_time)
d$sched_time <- parse_date_time(d$sched_time, "HMp")
head(d$sched_time)
'parse_date_time("02:30 PM", "HMp")
temp <- parse_date_time("02:30 PM", "HMp")
str(temp)
temp <- as.character(temp)
str(temp)'
library(stringr)
head(str_sub(d$sched_time, start = 12, end = 16))
d$sched_time <- str_sub(d$sched_time, start = 12, end = 16)
head(d$sched_time)
#d$dispchd
head(d$dispchd)
d$dispchd <- parse_date_time(d$dispchd, "HMp")
head(d$dispchd)
head(str_sub(d$dispchd, start = 12, end = 16))
d$dispchd <- str_sub(d$dispchd, start = 12, end = 16)
head(d$dispchd)
#d$onsite
head(d$onsite)
d$onsite <- parse_date_time(d$onsite, "HMp")
head(d$onsite)
head(str_sub(d$onsite, start = 12, end = 16))
d$onsite <- str_sub(d$onsite, start = 12, end = 16)
head(d$onsite)
str(d)
#d$complt
head(d$complt)
d$complt <- parse_date_time(d$complt, "HMp")
head(d$complt)
head(str_sub(d$complt, start = 12, end = 16))
d$complt <- str_sub(d$complt, start = 12, end = 16)
head(d$complt)
str(d)
#d$est_duration
d$est_duration <- str_sub(d$est_duration, start = 1, end = 4)
str(d$est_duration)
head(as.numeric(d$est_duration))
d$est_duration <- as.numeric(d$est_duration)
str(d$est_duration)

#check for row duplicates
sum(duplicated(d))
#don't forget to set wd
write.csv(d, "assignments_01_20.csv", row.names = FALSE)
###don't forget to delete the index variable!