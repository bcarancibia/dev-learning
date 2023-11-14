library(tidytuesdayR)
library(tidyverse)

tuesdata <- tidytuesdayR::tt_load('2023-11-14')
diwali <- tuesdata$diwali_sales_data

diwali <- diwali %>% 
  select(!(c(Status, unnamed1)))

