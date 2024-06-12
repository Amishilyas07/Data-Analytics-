library(tidyverse)
library(ggplot2)
setwd("E:/Data Analyst Roadmap/Google Data Analytics Certificate Course/R Language/R datasets/Lesson 3 asthetics")
hotel <- read_csv("hotel_bookings.csv")

view(hotel)

#summary_hotel <- hotel %>%
 # group_by(distribution_channel) %>%
#  summarise(bookings = sum(booking_changes))%>%
 # drop_na()%>%
#  arrange(desc(bookings))
#summary_hotel

ggplot(data = hotel) + geom_bar(mapping = aes(x=distribution_channel,fill=distribution_channel))

# TA/TO has most bookings 

# distribution with deposit type
ggplot(data = hotel) +
  geom_bar(mapping = aes(x = distribution_channel,fill=deposit_type ))

# distribution with market_segment
ggplot(data = hotel) +
  geom_bar(mapping = aes(x = distribution_channel,fill=market_segment ))

ggplot(data = hotel) +
  geom_bar(mapping = aes(x = distribution_channel,fill = distribution_channel))+
  facet_wrap(~deposit_type)

ggplot(data = hotel) +
  geom_bar(mapping = aes(x = distribution_channel,fill = distribution_channel)) +
  facet_wrap(~deposit_type) +
  theme(axis.text.x = element_text(angle = 45))

ggplot(data = hotel) +
  geom_bar(mapping = aes(x = distribution_channel,fill = distribution_channel)) +
  facet_grid(~deposit_type) +
  theme(axis.text.x = element_text(angle = 45))


ggplot(data = hotel) +
  geom_bar(mapping = aes(x = distribution_channel)) +
  facet_wrap(~deposit_type~market_segment) +
  theme(axis.text.x = element_text(angle = 45))