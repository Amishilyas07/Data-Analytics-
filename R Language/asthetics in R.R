library(tidyverse)
library(palmerpenguins)
data("penguins")
view(penguins)
library(ggplot2)
ggplot(data = penguins) + geom_point(mapping = aes(x=flipper_length_mm,y=bill_length_mm,color=species,shape=species,alpha=species))

# if we want same color

ggplot(data = penguins) + geom_point(mapping = aes(x=flipper_length_mm,y=bill_length_mm,alpha=species),color="orange")