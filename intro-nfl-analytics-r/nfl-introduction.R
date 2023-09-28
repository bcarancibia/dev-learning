library(nflverse)
library(tidyverse)
participation <- nflreadr::load_participation(2022, include_pbp = TRUE)

rosters <- nflreadr::load_rosters(2022) %>%
  select(full_name, gsis_id, depth_chart_position)

oline_participation <- participation %>%
  filter(play_type %in% c("pass", "run")) %>%
  group_by(nflverse_game_id, possession_team, fixed_drive) %>%
  filter(fixed_drive == 1 | fixed_drive == 2) %>%
  filter(row_number() == 1) %>%
  select(nflverse_game_id, play_id, possession_team, 
         offense_personnel, offense_players) %>%
  dplyr::mutate(gsis_id = stringr::str_split(offense_players, ";")) %>%
  tidyr::unnest(c(gsis_id)) %>%
  left_join(rosters, by = c("gsis_id" = "gsis_id"))

oline_participation <- oline_participation %>%
  filter(depth_chart_position %in% c("T", "G", "C")) %>%
  group_by(nflverse_game_id, possession_team) %>%
  mutate(starting_line = toString(full_name)) %>%
  select(nflverse_game_id, possession_team, 
         offense_personnel, starting_line) %>%
  distinct()

oline_participation %>%
  group_by(offense_personnel) %>%
  summarize(total = n())


oline_snap_counts <- nflreadr::load_snap_counts(2022)
oline_snap_count <- oline_snap_counts %>%
  select(game_id, week, player, position, team, offense_pct) %>%
  filter(position %in% c("T", "G", "C")) %>%
  group_by(game_id, team) %>%
  arrange(-offense_pct) %>%
  dplyr::slice(1:5) %>%
  ungroup()

oline_snap_counts
