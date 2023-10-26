library(tidyverse)
library(tidytuesdayR)
tuesdata <- tidytuesdayR::tt_load('2023-10-24')


patient_risk_profiles <- tuesdata$patient_risk_profiles

View(patient_risk_profiles)

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





