library(tidyverse)
library(ggplot2)
setwd("E:/Data Analyst Roadmap/Google Data Analytics Certificate Course/R Language/R datasets/Lesson 4 Annotations")

read.csv("hotel_bookings.csv")

ggplot(data = hotel) +
  geom_bar(mapping = aes(x = market_segment)) +
  facet_wrap(~hotel)

ggplot(data = hotel) +
  geom_bar(mapping = aes(x = market_segment,fill=hotel)) +
  facet_wrap(~hotel) +
  labs(title="Market Segment Of Different Hotels")


min_date <- min(hotel$arrival_date_year)

max_date <- max(hotel$arrival_date_year)


ggplot(data = hotel) +
  geom_bar(mapping = aes(x = market_segment,fill=hotel)) +
  facet_wrap(~hotel) +
  theme(axis.text.x = element_text(angle = 45)) +
  labs(title="Comparison of market segments by hotel type for hotel bookings",
       subtitle=paste0("Data from: ", min_date, " to ", max_date))


ggplot(data = hotel) +
  geom_bar(mapping = aes(x = market_segment)) +
  facet_wrap(~hotel) +
  theme(axis.text.x = element_text(angle = 45)) +
  labs(title="Comparison of market segments by hotel type for hotel bookings",
       caption=paste0("Data from: ", min_date, " to ", max_date))


ggplot(data = hotel) +
  geom_bar(mapping = aes(x = market_segment)) +
  facet_wrap(~hotel) +
  theme(axis.text.x = element_text(angle = 45)) +
  labs(title="Comparison of market segments by hotel type for hotel bookings",
       caption=paste0("Data from: ", min_date, " to ", max_date),
       x="Market Segment",
       y="Number of Bookings")