library(tidyverse)
library(palmerpenguins)
library(ggplot2)

data("penguins")

ggplot(data = penguins) + geom_point(mapping = aes(x=flipper_length_mm,y=body_mass_g,color=species))+
  facet_wrap(~species)

ggplot(data = diamonds) + geom_bar(mapping = aes(x=color , fill = cut))+
  facet_wrap(~cut)

ggplot(data = penguins) + geom_point(mapping = aes(x=flipper_length_mm,y=body_mass_g,color=species))+
  facet_grid(~species)