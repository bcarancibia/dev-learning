library(tidytuesdayR)
library(tidyverse)
library(viridis)
library(hrbrthemes)



tuesdata <- tidytuesdayR::tt_load('2024-01-09')
canada_births_1991_2022 <- tuesdata$canada_births_1991_2022
nhl_player_births <- tuesdata$nhl_player_births
nhl_rosters <- tuesdata$nhl_rosters
nhl_teams <- tuesdata$nhl_teams

canada_births_1991_2022 |> 
  ggplot(aes(x = month, y = births, group=year, color = year)) +
  geom_line() +
  scale_x_continuous(breaks = seq(0, 12, by = 1)) +
  facet_wrap(~ year)

#recreate graphic of year, with highlight

tmp <- canada_births_1991_2022 |> 
  mutate(year2 = year)

tmp |> 
  ggplot(aes(x = month, y = births)) +
  geom_line(data = tmp |> dplyr::select(-year), aes(group=year2), color = "grey", linewidth=0.5, alpha=0.5) +
  geom_line(aes(color=year), color="#69b3a2", linewidth=1.2 ) +
  scale_color_viridis(discrete = TRUE) +
  theme_ipsum() +
  theme(
    legend.position="none",
    plot.title = element_text(size=14),
    panel.grid = element_blank()
  ) +
  ggtitle("A spaghetti chart of Canada Births from 1991 to 2022") +
  facet_wrap(~year)



# Remove nhl player births that are not available for canada births
# remove everything before 1991

nhl_player_births_filter <- nhl_player_births |> 
  filter(birth_year >= 1991)
