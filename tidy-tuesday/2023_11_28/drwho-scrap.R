library(tidytuesdayR)
library(tidyverse)

tuesdata <- tidytuesdayR::tt_load('2023-11-28')

drwho_episodes <- tuesdata$drwho_episodes
drwho_directors <- tuesdata$drwho_directors
drwho_writers <- tuesdata$drwho_writers

ggplot(drwho_episodes, aes(x=season_number, y = rating))+
  geom_point() +
  geom_smooth()
  

              