library(tidyverse)
d <- customers_01_20
str(d)
colnames(d) <- c("billing_no",
                 "last_name",
                 "first_name",
                 "blank",
                 "phone",
                 "address",
                 "city",
                 "state",
                 "zip",
                 "date_join",
                 "blank_2",
                 "blank_3",
                 "blank_4",
                 "blank_5")
d <- d %>% select(billing_no, first_name, last_name, address, city, zip, date_join)

#read in email data
emails <- customers_01_20_emails
colnames(emails) <- c("billing_no", "emails")
'### ISSUE WITH BILLING_NO AS FACTOR DUE TO WEIRD TYPO THING
str(emails)
emails$billing_no <- as.integer(as.character(emails$billing_no))
str(emails)
emails$billing_no[is.na(emails$billing_no)] <- 129146
'
d <- left_join(d, emails, by = "billing_no")

library(lubridate)
d$date_join <- mdy(d$date_join)


#don't forget to set wd
write.csv(d, "customers_01_20.csv", row.names = FALSE)

