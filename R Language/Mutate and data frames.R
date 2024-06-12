library(ggplot2)
data("diamonds")
View(diamonds)
head(diamonds)
# mutate function is used for adding new column
library(tidyverse)
colnames(diamonds)
mutate(diamonds,carat_2=carat *100)


# Activity Creating Data frames 

# install tidyverse package 
install.packages("tidyverse")

# load tidyverse library

library(tidyverse)

# creating data frames best way is to create vectors and then combine the data using package
# data.frames()

names <- c("Amish","John","Harry","SRK")
age <- c(21,15 ,25 ,39)

people <- data.frame(names,age)
people

mutate(people,double_age = age * 2)

# more Practice 

fruits <- c("Apple","Orange","banana","Guava","kiwi")

rank_of_fruit <- c(1,5,3,4,2)

fruits_by_rank <- data.frame(fruits,rank_of_fruit)
fruits_by_rank

manipuating_fruits <- fruits_by_rank %>%
  group_by(rank_of_fruit) %>%
  arrange(rank_of_fruit)
manipuating_fruits