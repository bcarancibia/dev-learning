library(tidyverse)
library(janitor)
library(ggthemes)
library(paletteer)

house <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2023/2023-11-07/house.csv')


theme_ben <- function(){
  theme_minimal(base_size = 12, base_family = "") %+replace%
    theme(
      panel.grid.minor = element_blank(),
      plot.background = element_rect(fill = 'floralwhite', color = "floralwhite"),

    )
}



glimpse(house)

house %>% 
  count(party, sort = TRUE)

percent_party <- house %>% 
  mutate(percent_vote = candidatevotes / totalvotes) %>% 
  select(percent_vote, party, candidate, candidatevotes, totalvotes, state, state_po, state_fips, office)

glimpse(percent_party)

house %>% 
  count(party, sort = TRUE) %>% 
  mutate(percent = (n / 32452)*100)


# drop any party that has less than 1 percent of vote

percent_party_filter <- percent_party %>% 
  filter(party %in% c("DEMOCRAT", "REPUBLICAN", NA,
                      "LIBERTARIAN", "INDEPENDENT", "CONSERVATIVE",
                      "GREEN", "NATURAL LAW"))

ggplot(percent_party_filter, (aes(candidatevotes / totalvotes, fill = party))) +
  geom_histogram(position = "identity", bins = 40, alpha = 0.7) + 
  labs(x = "% of total votes", y = "Number of elections", fill = NULL) +
  theme_ben()






  