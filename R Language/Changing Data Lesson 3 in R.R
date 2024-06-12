library(tidyverse)
library(skimr)
library(janitor)
setwd("E:/Data Analyst Roadmap/Google Data Analytics Certificate Course/R Language/R datasets/Lesson 3 Changing")
hotel_bookings <- read_csv("hotel_bookings_change.csv")

head(hotel_bookings)
view(hotel_bookings)

# there are 32 columns in the dataset 
# arrivat_date_month is char type  so it is true

glimpse(hotel_bookings)

colnames(hotel_bookings)

arranged_df<- arrange(hotel_bookings,desc(lead_time))
view(arranged_df)
# 737 is the highest lead time of lead_time

head(hotel_bookings)

hotel_bookings_v2 <- arrange(hotel_bookings,desc(lead_time))

head(hotel_bookings_v2)

max(hotel_bookings_v2 $lead_time)

min(hotel_bookings_v2 $lead_time)

mean(hotel_bookings $lead_time)

hotel_bookings_city <-filter(hotel_bookings, hotel_bookings$hotel=="City Hotel")
head(hotel_bookings_city)

mean(hotel_bookings_city $lead_time)

view(hotel_bookings)
hotel_summary <- hotel_bookings %>%
  group_by(hotel) %>%
  summarise(max_lead_Time = max(lead_time),min_lead_time =min(lead_time))
hotel_summary

