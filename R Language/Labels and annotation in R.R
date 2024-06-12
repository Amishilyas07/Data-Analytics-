library(tidyverse)
library(palmerpenguins)
library(ggplot2)

data("penguins")

view(penguins)

ggplot(data = penguins) + geom_point(mapping = aes(x=flipper_length_mm,y=bill_length_mm,color=species))+
  labs(title = "Palmer Penguins : Flipper Length vs Bill Length",subtitle = "Sample of 3 species",caption = "Data collected By Doctor Kristein Gorman")+
  annotate("text",x=220,y=40,label="Gentoos are Largest",color="orange",fontface="bold",size=3.5)