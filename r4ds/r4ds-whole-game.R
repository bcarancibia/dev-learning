https://r4ds.hadley.nz/

library(tidyverse)
library(palmerpenguins)
library(ggthemes)

penguins
glimpse(penguins)

#create a plot that looks at flipper size vs body mass

ggplot(data = penguins)

ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point()
