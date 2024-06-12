install.packages("Tmisc")

library(Tmisc)
data("quartet")
view(quartet)

quartet %>%
  group_by(set) %>%
  summarise(mean(x),sd(x),mean(y),sd(y),cor(x,y))

install.packages('datasauRus') 
library('datasauRus')
library(tidyverse)
ggplot(datasaurus_dozen,aes(x=x,y=y,colour=dataset))+geom_point()+theme_void()+theme(legend.position = "none")+facet_wrap(~dataset,ncol=3)