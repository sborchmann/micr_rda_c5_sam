
#I am still having issues getting R to read my saved data files, so this does not actually run yet

library(tidyverse)

colloquium_assessment <- read_csv("r projects i think i did this right/notes/2_18_class/micr_rda_c5_7-main/data/colloquium_assessment.csv")
View(colloquium_assessment)

colloquium_assessment |>
  pivot_longer(cols=c('Q4', 'Q5', 'Q6', 'Q7', 'Q8', 'Q9', 'Q10', 'Q11', 'Q12', 'Q13', 'Q14'),
               names_to = 'Question',
               values_to = 'score')

avg_score |>
  group_by(Question) |>
  summarise(
    avg_total = mean(score, na.rm = TRUE)
  )

avg_score |>
  group_by(Question) |>
  filter(Question >= 7 & Question >= 14) |>
  summarise(
    avg_after_7 = mean(score, na.rm = TRUE)
  )

