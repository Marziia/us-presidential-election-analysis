#### Preamble ####
# Purpose: Tests the structure and validity of the simulated U.S. presidential election dataset.
# Author: Marzia Zaidi
# Date: 2 November 2024
# Contact: marzia.zaidi@utoronto.ca
# License: MIT
# Pre-requisites: 
# - The `tidyverse` package must be installed and loaded
# - 03-simulate_data.R must have been run

#### Workspace setup ####
library(tidyverse)

# Load the simulated data
simulated_election_data <- read_csv("data/simulated_data/us_election_simulated_data.csv")

# Test if the data was successfully loaded
if (exists("simulated_election_data")) {
  message("Test Passed: The dataset was successfully loaded.")
} else {
  stop("Test Failed: The dataset could not be loaded.")
}

#### Test data ####

# Check if the dataset has 1000 rows
if (nrow(simulated_election_data) == 1000) {
  message("Test Passed: The dataset has 1000 rows.")
} else {
  stop("Test Failed: The dataset does not have 1000 rows.")
}

# Check if the dataset has 5 columns
if (ncol(simulated_election_data) == 5) {
  message("Test Passed: The dataset has 5 columns.")
} else {
  stop("Test Failed: The dataset does not have 5 columns.")
}

# Check if all values in the 'state' column are valid U.S. state names
valid_states <- c("Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado",
                  "Connecticut", "Delaware", "Florida", "Georgia", "Hawaii", "Idaho", 
                  "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", 
                  "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", 
                  "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", 
                  "New Hampshire", "New Jersey", "New Mexico", "New York", 
                  "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", 
                  "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", 
                  "Tennessee", "Texas", "Utah", "Vermont", "Virginia", 
                  "Washington", "West Virginia", "Wisconsin", "Wyoming")

if (all(simulated_election_data$state %in% valid_states)) {
  message("Test Passed: The 'state' column contains only valid U.S. state names.")
} else {
  stop("Test Failed: The 'state' column contains invalid state names.")
}

# Check if the 'party' column contains only "Democratic" or "Republican"
valid_parties <- c("Democratic", "Republican")

if (all(simulated_election_data$party %in% valid_parties)) {
  message("Test Passed: The 'party' column contains only valid party names.")
} else {
  stop("Test Failed: The 'party' column contains invalid party names.")
}

# Check if 'pollscore' values are numeric and finite
if (all(is.numeric(simulated_election_data$pollscore) & is.finite(simulated_election_data$pollscore))) {
  message("Test Passed: The 'pollscore' column contains only numeric, finite values.")
} else {
  stop("Test Failed: The 'pollscore' column contains non-numeric or non-finite values.")
}

# Check if 'sample_size' values are positive integers
if (all(simulated_election_data$sample_size > 0 & simulated_election_data$sample_size %% 1 == 0)) {
  message("Test Passed: The 'sample_size' column contains only positive integers.")
} else {
  stop("Test Failed: The 'sample_size' column contains non-integer or non-positive values.")
}

# Check if 'vote_percentage' values are between 30 and 70
if (all(simulated_election_data$vote_percentage >= 30 & simulated_election_data$vote_percentage <= 70)) {
  message("Test Passed: The 'vote_percentage' column values are within the range of 30 to 70.")
} else {
  stop("Test Failed: The 'vote_percentage' column values are outside the range of 30 to 70.")
}

# Check if there are any missing values in the dataset
if (all(!is.na(simulated_election_data))) {
  message("Test Passed: The dataset contains no missing values.")
} else {
  stop("Test Failed: The dataset contains missing values.")
}

# Check if there are at least two unique states and two unique parties
if (n_distinct(simulated_election_data$state) >= 2) {
  message("Test Passed: The 'state' column contains at least two unique state names.")
} else {
  stop("Test Failed: The 'state' column contains less than two unique state names.")
}

if (n_distinct(simulated_election_data$party) == 2) {
  message("Test Passed: The 'party' column contains both 'Democratic' and 'Republican'.")
} else {
  stop("Test Failed: The 'party' column does not contain both 'Democratic' and 'Republican'.")
}
