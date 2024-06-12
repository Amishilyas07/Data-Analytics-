library(tidyverse)
head(penguins)
penguins %>%
  arrange(bill_length_mm) # ascending order

penguins %>%
  arrange(-bill_length_mm)

penguins2 <-penguins %>%
  arrange(-bill_length_mm)

view(penguins2)



penguins %>%
  group_by(island) %>%
  drop_na() %>%
  summarise(mean_of_bill_len = mean(bill_length_mm))

penguins %>%
  group_by(island) %>%
  drop_na() %>%
  summarise(max_bill_len = max(bill_length_mm))

# grouping by 2 columns 
penguins %>%
  group_by(species,island) %>%
  drop_na() %>%
  summarise(max_bil_len = max(bill_length_mm),mean_bill_len = mean(bill_length_mm))

view(penguins)

penguins %>%
  filter(species=='Adelie') %>% 
  drop_na()