#### Preamble ####
# Purpose: Cleans the data set downloaded from FiveThirtyEight
# Author: Marzia Zaidi
# Date: 25 Oct 2024
# Contact: marzia.zaidi@utoronto.ca 
# License: MIT

#### Workspace setup ####
library(tidyverse)
# Load the gt library for better visualization of some tables
library(gt)

#### Clean data ####
polls_data <- read_csv("data/raw_data/election_polls.csv")
# Select relevant columns for analysis
polls_data_cleaned <- polls_data %>%
  select(pollscore, sample_size, state, party, candidate_name, pct) %>%
  filter(!is.na(pollscore) & !is.na(sample_size) & !is.na(state) & !is.na(pct))


# Create binary 'win' variable where pct > 50 is considered a win
polls_data_cleaned <- polls_data_cleaned %>%
  mutate(win = ifelse(pct > 50, 1, 0),
         party_binary = ifelse(party == "DEM", 1, 0))  # DEM = 1, REP = 0

# Display cleaned data
polls_data_cleaned %>%
  head() %>%
  gt() %>%
  tab_header(
    title = "Cleaned Poll Data",
    subtitle = "Displaying a few sample of the cleaned data"
  )
#### Save data ####
write_csv(polls_data_cleaned, "data/analysis_data/election_polls_cleaned.csv")
