library(tidytuesdayR)
library(tidyverse)
#devtools::install_github("katiejolly/nationalparkcolors")
library(nationalparkcolors)

font_legend <- 'Merriweather Sans'

theme_ben <- function(){
  theme_minimal(base_size = 12, base_family = font_legend) %+replace%
    theme(
      panel.grid.minor = element_blank(),
      plot.background = element_rect(fill = 'floralwhite', color = "floralwhite"),
      
    )
}


tuesdata <- tidytuesdayR::tt_load('2023-12-05')

life_expectancy <- tuesdata$life_expectancy
life_expectancy_different_ages <- tuesdata$life_expectancy_different_ages
life_expectancy_female_male <- tuesdata$life_expectancy_female_male


life_expectancy_afg <- life_expectancy |> 
  filter(Code == "AFG")

ggplot(life_expectancy_afg, aes(x=Year, y = LifeExpectancy)) +
  geom_line() + 
  theme_ben()

