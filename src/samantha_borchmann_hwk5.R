library(tidyverse)
library(janitor)
#Q1
data <- read_csv("data/sample_data.csv", na = c("N/A", ""))

data |> 
  janitor::clean_names() |>
  mutate(
    meal_plan = factor(meal_plan),
    age = parse_number(if_else(age == "five", "5", age))
  )

#Q2
?read_csv
Q2 <- read_csv("data/colloquium_assessment.csv", skip=6, col_names=c("StartDate","EndDate","Status","Progress","Duration","Finished","RecordedData","ResponseID","RecipientLast","RecipientFirst","RecipientEmail","ExternalReference","LocationLatitude","LocationLongitude","DistributionChannel","UserLanguage",'Q4','Q5','Q6','Q7','Q8','Q9','Q10','Q11','Q12'), na = c("N/A", ""))
#tried to get rid of the first few rows since they were making the pivot longer weird...there is probably a way easier way that i can't figure out though
View(Q2)


Q2_longer <- Q2 |>
  pivot_longer(
    cols=Q4:Q11,
    names_to="Question",
    values_to="Score",
    values_drop_na = TRUE) |>
  mutate(
    Question=parse_number(Question)
  )
#i couldn't figure out how to pivot Q12 with everything else, and since it's not needed for Q3 i just left it out

View(Q2_longer)

#Q3

Q2_longer |>
  filter(Question %in% c(7,8,9,10), na.rm = TRUE) |> 
  summarize(
    Score = mean(Score, na.rm = TRUE), 
    .by = Question
  )