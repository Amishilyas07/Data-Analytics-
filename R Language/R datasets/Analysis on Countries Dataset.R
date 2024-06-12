library(tidyverse)

data()

my_df <- population

head(population)
view(my_df)

total_population_by_Countries <- my_df %>%
   summarise(Population =sum(population),.by = country)

view(total_population_by_Countries)

top_5_most_population_countries <- total_population_by_Countries %>%
  arrange(desc(Population)) %>%
  head(5)

view(top_5_most_population_countries)

ggplot(top_5_most_population_countries,aes(x=country,y=Population,fill=population)) + 
  geom_bar(stat = "identity",position = "dodge")

  