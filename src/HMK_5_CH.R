library(tidyverse)

#Question 1
sample_data <- read_csv("/Users/cailynhaube/Library/CloudStorage/OneDrive-UniversityofTennessee/Class/S2026/DataReproducibility/micr_rda_c5_7_haubein/data/sample_data.csv")
  sample_named <- sample_data |> 
    rename(
      id = `Student ID`,
      name = `Full Name`, 
      fav_food= `favourite.food`,
      meal_plan= `mealPlan`, 
      age= `AGE`
      )

#Question 1 pt 2
col_assess <- read_csv("/Users/cailynhaube/Library/CloudStorage/OneDrive-UniversityofTennessee/Class/S2026/DataReproducibility/micr_rda_c5_7_haubein/data/colloquium_assessment.csv")
  col_cleaned <- col_assess[rowSums(is.na(col_assess)) != ncol(col_assess) ]
  col_adjusted <- col_cleaned[-(1:2), ]

#Question 2
col_pivot <- col_adjusted |> 
    pivot_longer(
      cols = starts_with("Q"), 
      names_to = "question", 
      values_to = "score"
    )

#Question 3 
 library (dplr)

average_scores <- col_pivot %>%
  mutate(score = as.numeric (score)) %>%
  filter(question %in% c("Q7", "Q8", "Q9", "Q10")) %>%
  group_by(ResponseId) %>%
  summarise(
    MeanScore_Q7_10 = mean(score, na.rm = FALSE) # na.rm = TRUE removes any missing values
  )

