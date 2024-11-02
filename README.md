# US Presidential Election Forecasting

## Overview

  This paper presents a model that forecasts the 2024 U.S. presidential election using data from over 14,000 aggregated polls. The model incorporates poll quality, sample size, state effects, and party affiliation to assess the likelihood of candidate success. Results from the analysis show that Donald Trump leads slightly with 43.7% of the vote, compared to Kamala Harris at 43.1%, a difference of 0.6%. In key battleground states, Trump is expected to win Florida by 51% to 49%, and Harris holds a higher edge in Pennsylvania at 52% to 48%. Poll quality is moderate for both candidates. The analysis shows that poll characteristics and state-specific factors play important roles in shaping election predictions.

## File Structure

The repo is structured as:

-   `data/raw_data` contains the raw data as obtained from FiveThirtyEight.
-   `data/analysis_data` contains the cleaned dataset that was constructed.
-   `model` contains fitted models. 
-   `other` contains relevant literature, details about LLM chat interactions, and sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download and clean data.


## Statement on LLM usage

Aspects of the code were written with the help of ChatGPT. The entire chat history is available in inputs/llms/*.txt.



