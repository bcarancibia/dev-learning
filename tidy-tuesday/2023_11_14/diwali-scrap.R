library(tidytuesdayR)
library(tidyverse)
library(ggthemes)
library(paletteer)

tuesdata <- tidytuesdayR::tt_load('2023-11-14')
diwali <- tuesdata$diwali_sales_data

theme_ben <- function(){
  theme_minimal(base_size = 12, base_family = "") %+replace%
    theme(
      panel.grid.minor = element_blank(),
      plot.background = element_rect(fill = 'floralwhite', color = "floralwhite"),
      
    )
}
#quick EDA

diwali %>% 
  ggplot(aes(x=Gender)) +
  geom_histogram(stat='count') +
  theme_ben()


diwali %>% 
  ggplot(aes(x=`Age Group`)) +
  geom_histogram(stat = 'count') +
  theme_ben()

diwali %>% 
  ggplot(aes(x = Age)) +
  geom_density() +
  theme_ben()

##look at state sales

diwali %>% 
  ggplot(aes(x=State)) +
  geom_histogram(stat = 'count') + 
  theme_ben()

diwali %>% 
  ggplot(aes(x=Occupation)) +
  geom_histogram(stat = 'count') +
  theme_ben()

diwali %>% 
  ggplot(aes(x=Amount)) +
  geom_density() +
  theme_ben()


#can you predict how much someone will spend?

library(tidymodels)
library(corrr)


