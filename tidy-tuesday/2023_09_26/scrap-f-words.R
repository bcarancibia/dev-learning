library(tidyverse)
library(tidytuesdayR)
tuesdata <- tidytuesdayR::tt_load('2023-09-26')


richmondway <- tuesdata$richmondway

richmondway %>% 
  ggplot(aes(x=Episode, y = cum_total_season, group = Season, colour = Season)) +
  geom_line()

richmondway %>% 
  ggplot(aes(x=cum_total_season, y = Imdb_rating)) +
  geom_point()
