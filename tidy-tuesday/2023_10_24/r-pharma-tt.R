library(tidyverse)
library(tidytuesdayR)
library(janitor)

tuesdata <- tidytuesdayR::tt_load('2023-10-24')


patient_risk_profiles <- tuesdata$patient_risk_profiles
patient_risk_profiles %>% 
  clean_names()

View(patient_risk_profiles)

test2compare <- readr::read_csv(
  'https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2023/2023-10-24/patient_risk_profiles.csv'
) |> 
  clean_names()

#weird thing where sex is both male and female
patient_risk_profiles %>%
  select(personId, `Sex = FEMALE`, `Sex = MALE`) %>%
  filter(`Sex = FEMALE` == 1 & `Sex = MALE` == 1)
# occurs 9 times.... dropping those observations

colnames(patient_risk_profiles)[21] = "Female"
colnames(patient_risk_profiles)[22] = "Male"

colnames(patient_risk_profiles)

#test out changing columns
test <- patient_risk_profiles[!(patient_risk_profiles$Female == 1 & patient_risk_profiles$Male == 1), ] 
  
test <- test %>% 
  mutate(Sex = case_when(`Female` == 1 ~ 'M',
                         `Male` == 1 ~ 'F')) %>% 
  select(-Female, -Male)

View(test)



test <- test %>% 
  mutate(age_group = case_when(
    age_group_0_4 == 1 ~ "0-4",
    age_group_5_9 == 1 ~ "5-9",
    age_group_10_14 == 1 ~ "10-14",
    age_group_15_19 == 1 ~ "15-19",
    age_group_20_24 == 1 ~ "20-24",
    age_group_25_29 == 1 ~ "25-29",
    age_group_30_34 == 1 ~ "30-34",
    age_group_35_39 == 1 ~ "35-39",
    age_group_40_44 == 1 ~ "40-44",
    age_group_45_49 == 1 ~ "45-49",
    age_group_50_54 == 1 ~ "50-54",
    age_group_55_59 == 1 ~ "55-59",
    age_group_60_64 == 1 ~ "60-64",
    age_group_65_69 == 1 ~ "65-69",
    age_group_70_74 == 1 ~ "70-74",
    age_group_75_79 == 1 ~ "75-79",
    age_group_80_84 == 1 ~ "80-84",
    age_group_85_89 == 1 ~ "85-89",
    age_group_90_94 == 1 ~ "90-94",
    TRUE ~ NA_character_
  ),
  ) %>% 
  select(-starts_with("age_group_"),-starts_with("sex_"),-person_id)  %>% 
  relocate(age_group, Sex) %>%
  mutate(age_group = as.factor(age_group)) %>% 
  rename_all(~ gsub("antibiotics_|_in_prior_year", "", .)) %>%
  rename_at(vars(starts_with("predicted_risk_of")),
            ~ gsub("predicted_risk_of_", "", .)) %>% 
  rename(
    sudden_hearing_loss = sudden_hearing_loss_no_congenital_anomaly_or_middle_or_inner_ear_conditions,
    sudden_vision_loss = sudden_vision_loss_with_no_eye_pathology_causes,
    acute_pancreatitis = acute_pancreatitis_with_no_chronic_or_hereditary_or_common_causes_of_pancreatitis,
    treatment_resistant_depression = treatment_resistant_depression_trd,
    parkinsons_disease = parkinsons_disease_inpatient_or_with_2nd_diagnosis
  )

