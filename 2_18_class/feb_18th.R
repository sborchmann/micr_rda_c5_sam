
# read in data
students <- read_csv("data/student_info.csv")

# make the N/As go away
students <- read_csv("data/student_info.csv",na = c("n/a", ""))

# 'manually' make column headings 'syntactic':
students |> 
       rename(
             year_study = `year of study`,
             prog_exp = `level of programming experience (e.g. beginner, intermediate, advanced)`
         )

# or clean with the janitor package
install.packages("janitor")
students |> janitor::clean_names()

# try a group by, e.g. programming language
students |> group_by()

# make the data tidier
students |>
       separate_rows(`programming languages`, sep = ",")

# make it even tidier
students_tidy |>
       separate_rows(research_academic_interests, sep = ",|;|/|--")

# now do some plotting
