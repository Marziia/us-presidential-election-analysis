#### Preamble ####
# Purpose: Tests the structure and validity of the actual U.S. presidential election dataset.
# Author: Marzia Zaidi
# Date: 2 November 2024
# Contact: marzia.zaidi@utoronto.ca
# License: MIT
# Pre-requisites: 
# - The `tidyverse` package must be installed and loaded
# - The actual dataset must be saved in "data/analysis_data/election_polls_cleaned.csv"

#### Workspace setup ####
library(tidyverse)

# Load the actual election data
actual_election_data <- read_csv("data/analysis_data/election_polls_cleaned.csv")

# Test if the data was successfully loaded
if (exists("actual_election_data")) {
  message("Test Passed: The dataset was successfully loaded.")
} else {
  stop("Test Failed: The dataset could not be loaded.")
}

#### Test data ####

# Check if the dataset has at least 14,000 rows (as per the original analysis)
if (nrow(actual_election_data) >= 14000) {
  message("Test Passed: The dataset has at least 14,000 rows.")
} else {
  stop("Test Failed: The dataset does not have at least 14,000 rows.")
}

# Check if the dataset has the expected columns
expected_columns <- c("pollscore", "sample_size", "state", "party", "candidate_name", "pct", "win", "party_binary", "end_date")
if (all(expected_columns %in% names(actual_election_data))) {
  message("Test Passed: The dataset contains all expected columns.")
} else {
  stop("Test Failed: The dataset is missing one or more expected columns.")
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

if (all(actual_election_data$state %in% valid_states)) {
  message("Test Passed: The 'state' column contains only valid U.S. state names.")
} else {
  stop("Test Failed: The 'state' column contains invalid state names.")
}

# Check if the 'party' column contains only "Democratic" or "Republican"
valid_parties <- c("Democratic", "Republican")

if (all(actual_election_data$party %in% valid_parties)) {
  message("Test Passed: The 'party' column contains only valid party names.")
} else {
  stop("Test Failed: The 'party' column contains invalid party names.")
}

# Check if 'pollscore' values are numeric and finite
if (all(is.numeric(actual_election_data$pollscore) & is.finite(actual_election_data$pollscore))) {
  message("Test Passed: The 'pollscore' column contains only numeric, finite values.")
} else {
  stop("Test Failed: The 'pollscore' column contains non-numeric or non-finite values.")
}

# Check if 'sample_size' values are positive integers
if (all(actual_election_data$sample_size > 0 & actual_election_data$sample_size %% 1 == 0)) {
  message("Test Passed: The 'sample_size' column contains only positive integers.")
} else {
  stop("Test Failed: The 'sample_size' column contains non-integer or non-positive values.")
}

# Check if 'pct' values are between 0 and 100
if (all(actual_election_data$pct >= 0 & actual_election_data$pct <= 100)) {
  message("Test Passed: The 'pct' column values are within the range of 0 to 100.")
} else {
  stop("Test Failed: The 'pct' column values are outside the range of 0 to 100.")
}

# Check if 'end_date' values are valid dates
if (all(!is.na(as.Date(actual_election_data$end_date, format = "%Y-%m-%d")))) {
  message("Test Passed: The 'end_date' column contains valid date values.")
} else {
  stop("Test Failed: The 'end_date' column contains invalid date values.")
}

# Check if there are any missing values in the dataset
if (all(!is.na(actual_election_data))) {
  message("Test Passed: The dataset contains no missing values.")
} else {
  stop("Test Failed: The dataset contains missing values.")
}

# Check if there are at least two unique states and two unique parties
if (n_distinct(actual_election_data$state) >= 2) {
  message("Test Passed: The 'state' column contains at least two unique state names.")
} else {
  stop("Test Failed: The 'state' column contains less than two unique state names.")
}

if (n_distinct(actual_election_data$party) == 2) {
  message("Test Passed: The 'party' column contains both 'Democratic' and 'Republican'.")
} else {
  stop("Test Failed: The 'party' column does not contain both 'Democratic' and 'Republican'.")
}
