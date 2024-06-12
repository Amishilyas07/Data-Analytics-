library(ggplot2)
ggplot(data = penguins,aes(x=flipper_length_mm,y=body_mass_g))+geom_point(aes(color=sex))

