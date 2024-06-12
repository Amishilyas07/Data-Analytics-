library(tidyverse)

# head() IS USED to view first row of data 
head(diamonds)

view(diamonds)

# str() and glimpse() functions returns chunks of data
str(diamonds)

glimpse(diamonds)

# colnames() function is used to return the list of columns

colnames(diamonds)

# it is important to clean data important as a data analyst
# to rename columns we can use function
# rename()
rename(diamonds,carat_new=carat,cut_new = cut)

# Summarize is used to calculate the result as a whole it is like group by of SQL
summarize(diamonds, mean_carat = mean(carat))
