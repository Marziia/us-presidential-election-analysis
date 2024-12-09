#### Preamble ####
# Purpose: Models the US presidential election polls by using a GLM model
# Author: Marzia Zaidi
# Date: 25 Oct 2024
# Contact: marzia.zaidi@utoronto.ca 
# License: MIT
# Pre-requisites: Need to have the data downloaded and processed


#### Workspace setup ####
library(tidyverse)
# The broom library is used for converting the model output into a tidy data frame
library(broom)
# Load the knitr library for better visualization of some tables
library(knitr)

#### Read data ####
polls_data_cleaned <- read_csv("data/analysis_data/election_polls_cleaned.csv")

### Model data ####
# Fit the GLM model using logistic regression
glm_model <- glm(win ~ pollscore + sample_size + state + party_binary, family = binomial, data = polls_data_cleaned)

# Tidy the model output using broom's tidy() function
glm_tidy <- tidy(glm_model)

# Filter for statistically significant variables (p < 0.05)
glm_significant <- glm_tidy %>%
  filter(p.value < 0.05)

# Display the filtered results in a clean table format
glm_significant %>%
  kable(caption = "Statistically Significant Variables from the GLM Model")


#### Save model ####
saveRDS(
  glm_model,
  file = "models/glm_model.rds"
)
