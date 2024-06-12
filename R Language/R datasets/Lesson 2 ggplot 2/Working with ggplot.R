library(tidyverse)
library(ggplot2)
setwd("E:/Data Analyst Roadmap/Google Data Analytics Certificate Course/R Language/R datasets/Lesson 2 ggplot 2")

hotel <- read_csv("hotel_bookings.csv")

head(hotel)
view(hotel)
ggplot(data = hotel)+geom_point(mapping = aes(x=lead_time,y=children))
# most of the advance bookings are made by the people with 0 children 

# It is correct people with 0 children book the most weekend nights 
ggplot(data = hotel)+ geom_point(mapping = aes(x=stays_in_weekend_nights,y=children))

