library(tidyverse)

data("diamonds")
view(diamonds)

library(dplyr)

filtered_data <- diamonds %>%
  filter(carat>0.21) %>%
  group_by(color) %>%
  arrange(color)%>%
  summarise(mean_depth = mean(depth), .group = "Grouped Data")
 filtered_data
