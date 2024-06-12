# packages for Data cleaning

#install.packages("here")
library(here)
#install.packages("skimr")
library(skimr)
#install.packages("janitor")
library(janitor)
#install.packages("dplyr")
#install.packages("palmerpenguins")
library(palmerpenguins)
data(penguins)
skim_without_charts(penguins)
library(dplyr)
glimpse(penguins)
head(penguins)

penguins %>%
  select(species)

data("penguins")
head(penguins)

changing <- penguins %>%
  rename(island_new = island)
changing

penguins %>%
  rename_with(toupper)

penguins %>%
  clean_names()

rename_with(penguins,tolower())