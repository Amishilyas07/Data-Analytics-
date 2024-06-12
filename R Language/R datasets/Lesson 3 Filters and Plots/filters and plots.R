library(tidyverse)
library(ggplot2)
setwd("E:/Data Analyst Roadmap/Google Data Analytics Certificate Course/R Language/R datasets/Lesson 3 Filters and Plots")

hotel = read.csv("hotel_bookings.csv")

ggplot(data = hotel)+ geom_point(mapping = aes(x=lead_time,y=children,color = hotel))

ggplot(data = hotel) +
  geom_bar(mapping = aes(x = hotel, fill = market_segment))+

  # separate visualization for each market_segment
  ggplot(data = hotel) +
  geom_bar(mapping = aes(x = hotel,fill=market_segment)) +
  facet_wrap(~market_segment)


onlineta_city_hotels <- filter(hotel, 
                               (hotel=="City Hotel" & 
                                  market_segment=="Online TA"))

onlineta_city_hotels


# filtering data and then crating visualization

onlineta_city_hotels_v2 <- hotel %>%
  filter(hotel=="City Hotel") %>%
  filter(market_segment=="Online TA")

onlineta_city_hotels_v2


ggplot(data = onlineta_city_hotels_v2) +
  geom_point(mapping = aes(x = lead_time, y = children))
view(onlineta_city_hotels_v2)
# filtering data and then crating visualization