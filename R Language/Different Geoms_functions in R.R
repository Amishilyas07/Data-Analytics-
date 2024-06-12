library(tidyverse)
library(palmerpenguins)
library(ggplot2)

#combining different types of geomes with + sign

ggplot(data = penguins) + geom_point(mapping = aes(x=flipper_length_mm,y=body_mass_g)) + 
  geom_smooth(mapping = aes(x=flipper_length_mm,y=body_mass_g))

ggplot(data = penguins) + geom_jitter(mapping = aes(x=flipper_length_mm,y=body_mass_g))

view(diamonds)
ggplot(data = diamonds) + geom_bar(mapping = aes(x=cut,fill=cut))
