library(tidyverse)
library(readr)
# setwd() to change directory 
setwd("E:/Data Analyst Roadmap/Google Data Analytics Certificate Course/R Language/R datasets")
# read.csv() to read csv file 
read.csv("hotel_bookings.csv")
bookings_df <- read_csv("hotel_bookings.csv")
bookings_df
head(bookings_df)
str(bookings_df)
colnames(bookings_df)

new_df <- select(bookings_df,`adr`,adults)
mutated <- mutate(new_df,total= `adr`/ adults)
mutated
