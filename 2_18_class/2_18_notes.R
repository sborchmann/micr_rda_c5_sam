

students <- read.csv("student_info.csv")

students |>
  group_by(programming.languages..R..Python..Julia..etc..)
#issue: studenst list multiple languages in same cell

students |> 
  separate_rows(programming.languages..R..Python..Julia..etc.., sep = ",") |> 
  group_by (programming.languages..R..Python..Julia..etc..) |>
  summarize()
View(students)
