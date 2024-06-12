library(tidyverse)
library(skimr)
library(janitor)
setwd("E:/Data Cleaning")
bookings_dataFrame <- read_csv("hotel.csv")

head(bookings_dataFrame)
str(bookings_dataFrame)
colnames(bookings_dataFrame)
skim_without_charts(bookings_dataFrame)
# selecting particular columns
trimmed_df <- bookings_dataFrame %>%
  select(`hotel`,`is_canceled`,`lead_time`)
trimmed_df
# changing column name
new_trimmed_df <- trimmed_df %>%
  select(hotel,is_canceled,lead_time)%>%
  rename(Hotel_type = hotel)
new_trimmed_df

#  combine data in one columns
example_df <- bookings_dataFrame %>%
  select(arrival_date_year,arrival_date_month) %>%
  unite(arrival_month_Year ,c(arrival_date_month,arrival_date_year),sep = " ")
example_df

#splitting Data in different columns
splitting_data <- example_df %>%
  separate(arrival_month_Year,c("Month","Year"),sep = " ")
splitting_data

# making changes creating new column total_bum_people and then checking people sum 
mutating_example <- bookings_dataFrame %>%
  mutate(total_num_people = children + adults + babies)
mutating_example
view(mutating_example)

# doing statistics in R 

stat_example <- bookings_dataFrame %>%
  summarise(number_cancelled=sum(is_canceled),average_lead_value=mean(lead_time))
stat_example
 