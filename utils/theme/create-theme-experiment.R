library(tidyverse)
library(ggthemes)
library(paletteer)

#use iris as a way to test data / plots with themes
data(iris)
ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
  geom_point() +
  scale_color_paletteer_d("Redmonder::qPBI")+
  theme_ben()


font_legend <- 'Merriweather Sans'
font_add_google(font_legend)

theme_ben <- function(){
  theme_minimal(base_size = 12, base_family = font_legend) %+replace%
    theme(
      panel.grid.minor = element_blank(),
      plot.background = element_rect(fill = 'floralwhite', color = "floralwhite"),
      
    )
}

