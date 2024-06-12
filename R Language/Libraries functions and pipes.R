library(ggplot2)
# browseVignettes is used to view information about a package
browseVignettes("ggplot2")

# most commolnly use libraries for data analysts are 
# ggplot for visualizations
# tidyr for data cleaning 
# readr for importing data 
# dplyr for data manipulation filters etc 
# data() function is used to loadDatasets  
#library(tidyverse)
#data("ToothGrowth")
#View(ToothGrowth)

#flitered_tg = filter(ToothGrowth,dose==0.5)
#filteted_tg


#  using toothGrowth Dataset using tidyverse library to and function of dplyr library to manipulate data 
data("ToothGrowth")
view(ToothGrowth)
library(dplyr)
filtered_tg <- filter(ToothGrowth,dose==0.5)
filtered_tg

arrange(filtered_tg,len)

arrange(filter(filtered_tg,dose == 0.5),len)


# doing same thing using pipe operator %>%
filtered_tg_dataset <- ToothGrowth %>%
  filter(dose == 0.5) %>%
  arrange(len)
  filtered_tg_dataset