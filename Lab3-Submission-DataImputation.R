# STEP 1. Loading Dataset
## Dataset: BI1 Student Performance
Student_Performance_Dataset <-
  readr::read_csv(
    "Student_Performance_Dataset.csv", # nolint
    col_types =
      readr::cols(
        class_group =
          readr::col_factor(levels = c("A", "B", "C")),
        gender = readr::col_factor(levels = c("1", "0")),
        YOB = readr::col_date(format = "%Y"),
        regret_choosing_bi =
          readr::col_factor(levels = c("1", "0")),
        drop_bi_now =
          readr::col_factor(levels = c("1", "0")),
        motivator =
          readr::col_factor(levels = c("1", "0")),
        read_content_before_lecture =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        anticipate_test_questions =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        answer_rhetorical_questions =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        find_terms_I_do_not_know =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        copy_new_terms_in_reading_notebook =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        take_quizzes_and_use_results =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        reorganise_course_outline =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        write_down_important_points =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        space_out_revision =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        studying_in_study_group =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        schedule_appointments =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        goal_oriented =
          readr::col_factor(levels =
                              c("1", "0")),
        spaced_repetition =
          readr::col_factor(levels =
                              c("1", "2", "3", "4")),
        testing_and_active_recall =
          readr::col_factor(levels =
                              c("1", "2", "3", "4")),
        interleaving =
          readr::col_factor(levels =
                              c("1", "2", "3", "4")),
        categorizing =
          readr::col_factor(levels =
                              c("1", "2", "3", "4")),
        retrospective_timetable =
          readr::col_factor(levels =
                              c("1", "2", "3", "4")),
        cornell_notes =
          readr::col_factor(levels =
                              c("1", "2", "3", "4")),
        sq3r = readr::col_factor(levels =
                                   c("1", "2", "3", "4")),
        commute = readr::col_factor(levels =
                                      c("1", "2",
                                        "3", "4")),
        study_time = readr::col_factor(levels =
                                         c("1", "2",
                                           "3", "4")),
        repeats_since_Y1 = readr::col_integer(),
        paid_tuition = readr::col_factor(levels =
                                           c("0", "1")),
        free_tuition = readr::col_factor(levels =
                                           c("0", "1")),
        extra_curricular = readr::col_factor(levels =
                                               c("0", "1")),
        sports_extra_curricular =
          readr::col_factor(levels = c("0", "1")),
        exercise_per_week = readr::col_factor(levels =
                                                c("0", "1",
                                                  "2",
                                                  "3")),
        meditate = readr::col_factor(levels =
                                       c("0", "1",
                                         "2", "3")),
        pray = readr::col_factor(levels =
                                   c("0", "1",
                                     "2", "3")),
        internet = readr::col_factor(levels =
                                       c("0", "1")),
        laptop = readr::col_factor(levels = c("0", "1")),
        family_relationships =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        friendships = readr::col_factor(levels =
                                          c("1", "2", "3",
                                            "4", "5")),
        romantic_relationships =
          readr::col_factor(levels =
                              c("0", "1", "2", "3", "4")),
        spiritual_wellnes =
          readr::col_factor(levels = c("1", "2", "3",
                                       "4", "5")),
        financial_wellness =
          readr::col_factor(levels = c("1", "2", "3",
                                       "4", "5")),
        health = readr::col_factor(levels = c("1", "2",
                                              "3", "4",
                                              "5")),
        day_out = readr::col_factor(levels = c("0", "1",
                                               "2", "3")),
        night_out = readr::col_factor(levels = c("0",
                                                 "1", "2",
                                                 "3")),
        alcohol_or_narcotics =
          readr::col_factor(levels = c("0", "1", "2", "3")),
        mentor = readr::col_factor(levels = c("0", "1")),
        mentor_meetings = readr::col_factor(levels =
                                              c("0", "1",
                                                "2", "3")),
        `Attendance_Waiver_Granted` =
          readr::col_factor(levels = c("0", "1")),
        GRADE = readr::col_factor(levels =
                                    c("A", "B", "C", "D",
                                      "E"))),
    locale = readr::locale())


## STEP 2. Install and Load the Required Packages
## dplyr ----
if (!is.element("dplyr", installed.packages()[, 1])) {
  install.packages("dplyr", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
require("dplyr")

## naniar
if (!is.element("naniar", installed.packages()[, 1])) {
  install.packages("naniar", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
require("naniar")

##ggplot for Visualization
if (!is.element("ggplot2", installed.packages()[, 1])) {
  install.packages("ggplot2", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
require("ggplot2")

## MICE
# To perform data imputation
if (!is.element("mice", installed.packages()[, 1])) {
  install.packages("mice", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
require("mice")

## Amelia ----
if (!is.element("Amelia", installed.packages()[, 1])) {
  install.packages("Amelia", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
require("Amelia")

# STEP 3. Create a subset of the variables/features
Student_Performance_Dataset_subset <- Student_Performance_Dataset %>%
  select(class_group,gender,YOB,regret_choosing_bi,drop_bi_now,motivator,read_content_before_lecture,
         anticipate_test_questions,answer_rhetorical_questions,find_terms_I_do_not_know,
         copy_new_terms_in_reading_notebook,take_quizzes_and_use_results,reorganise_course_outline,
         write_down_important_points,space_out_revision,studying_in_study_group,schedule_appointments,
         goal_oriented,spaced_repetition,testing_and_active_recall,interleaving,categorizing,
         retrospective_timetable,cornell_notes,sq3r,commute,study_time,repeats_since_Y1,paid_tuition,
         free_tuition,extra_curricular,sports_extra_curricular,exercise_per_week,meditate,pray,internet,
         laptop,family_relationships,friendships,romantic_relationships,spiritual_wellnes,financial_wellness,
         health,day_out,night_out,alcohol_or_narcotics,mentor,mentor_meetings,GRADE,Quiz_1_Concept_1,EXAM,TOTAL,
         Quiz_4_Concept_4,Quizzes_and_Bonus_Marks,Lab_4_Linear_Discriminant_Analysis,CAT_1,CAT_2,
         Absenteeism_Percentage,Coursework_TOTAL,Lab_1_Simple_Linear_Regression,LabWork,Attendance_Waiver_Granted)

### Subset of rows
rand_ind <- sample(seq_len(nrow(Student_Performance_Dataset_subset)), 80)
Student_Performance_Dataset_rows <- Student_Performance_Dataset_subset[rand_ind, ]

# STEP 4. Confirm the "missingness" in the Dataset before Imputation
any_na(Student_Performance_Dataset_rows)

# How many?
n_miss(Student_Performance_Dataset_rows)

# What is the percentage of missing data in the entire dataset?
prop_miss(Student_Performance_Dataset_rows)

# How many missing values does each variable have?
Student_Performance_Dataset_rows %>% is.na() %>% colSums()

#What is the number and percentage of missing values grouped by
# each variable?
miss_var_summary(Student_Performance_Dataset_rows)

# What is the number and percentage of missing values grouped by
# each observation?
miss_case_summary(Student_Performance_Dataset_rows)

# Which variables contain the most missing values?
gg_miss_var(Student_Performance_Dataset_rows)


# Where are missing values located (the shaded regions in the plot)?
vis_miss(Student_Performance_Dataset_rows) + theme(axis.text.x = element_text(angle = 80))

# Which combinations of variables are missing together?
gg_miss_upset(Student_Performance_Dataset_rows)

# Create a heatmap of "missingness" broken down by "class_group"
# First, confirm that the "class_group" variable is a categorical variable
is.factor(Student_Performance_Dataset_rows$class_group)
# Second, create the visualization
gg_miss_fct(Student_Performance_Dataset_rows, fct = class_group)

# We can also create a heatmap of "missingness" broken down by "GRADE"
# First, confirm that the "GRADE" variable is a categorical variable
is.factor(Student_Performance_Dataset_rows$GRADE)
# Second, create the visualization
gg_miss_fct(Student_Performance_Dataset_rows, fct = GRADE)


# STEP 5. Use the MICE package to perform data imputation ----
# We can use the dplyr::mutate() function inside the dplyr package to add new
# variables that are functions of existing variables

# In this case, it is used to create a new variable called,
# "Mental_Health"

# Convert relevant columns to numeric
Student_Performance_Dataset_rows$alcohol_or_narcotics <- as.numeric(Student_Performance_Dataset_rows$alcohol_or_narcotics)
Student_Performance_Dataset_rows$health <- as.numeric(Student_Performance_Dataset_rows$health)
Student_Performance_Dataset_rows$Absenteeism_Percentage <- as.numeric(Student_Performance_Dataset_rows$Absenteeism_Percentage)

# alcohol_or_narcotics is weighted at 0.3, indicating that it contributes positively to mental health if it's lower (less alcohol intake).
# Score is weighted at 0.4, indicating that better health positively contributes to mental health.
# Absenteeism is weighted at -0.2, indicating that higher absenteeism has a negative impact on mental health.

# Calculate Mental_Health score
Student_Performance_Dataset_rows <- Student_Performance_Dataset_rows %>%
  mutate(Mental_Health = (0.3 * alcohol_or_narcotics) + (0.4 * health) - (0.2 * Absenteeism_Percentage))


# To arrive at good predictions for each variable containing missing values, we
# save the variables that are at least "somewhat correlated" (r > 0.3).
somewhat_correlated_variables <- quickpred(Student_Performance_Dataset_rows, mincor = 0.3) # nolint

Student_Performance_Dataset_mice <- mice(Student_Performance_Dataset_rows, m = 11, method = "pmm",
                            seed = 7,
                            predictorMatrix = somewhat_correlated_variables)

# One can then train a model to predict Mental_Health using family_relationships and exercise_per_week
# or to identify the p-Value and confidence intervals between Mental_Health and family_relationships and
# exercise_per_week

# Using multiple scatter plots (a.k.a. strip-plots) to visualize how
# random the imputed data is in each of the 11 datasets.
stripplot(Student_Performance_Dataset_mice,
          Mental_Health ~ family_relationships | .imp,
          pch = 20, cex = 1)

stripplot(Student_Performance_Dataset_mice,
          Mental_Health ~ exercise_per_week | .imp,
          pch = 20, cex = 1)


## Impute the missing data ----
# We then create imputed data for the final dataset using the mice::complete()
# function in the mice package to fill in the missing data.
Student_Performance_Dataset_imputed <- mice::complete(Student_Performance_Dataset_mice, 1)


# STEP 6. Confirm the "missingness" in the Imputed Dataset ----
# A textual confirmation that the dataset has no more missing values in any
# feature:
miss_var_summary(Student_Performance_Dataset_imputed)

# A visual confirmation that the dataset has no more missing values in any
# feature:
Amelia::missmap(Student_Performance_Dataset_imputed)

#########################
# Are there missing values in the dataset?
any_na(Student_Performance_Dataset_imputed)

# How many?
n_miss(Student_Performance_Dataset_imputed)

# What is the percentage of missing data in the entire dataset?
prop_miss(Student_Performance_Dataset_imputed)

# How many missing values does each variable have?
Student_Performance_Dataset_imputed %>% is.na() %>% colSums()

# What is the number and percentage of missing values grouped by
# each variable?
miss_var_summary(Student_Performance_Dataset_imputed)

# What is the number and percentage of missing values grouped by
# each observation?
miss_case_summary(Student_Performance_Dataset_imputed)

# Which variables contain the most missing values?
gg_miss_var(Student_Performance_Dataset_imputed)

# We require the "ggplot2" package to create more appealing visualizations

# Where are missing values located (the shaded regions in the plot)?
vis_miss(Student_Performance_Dataset_imputed) + theme(axis.text.x = element_text(angle = 80))

# Which combinations of variables are missing together?

# Note: The following command should give you an error stating that at least 2
# variables should have missing data for the plot to be created.
gg_miss_upset(Student_Performance_Dataset_imputed)

# Create a heatmap of "missingness" broken down by "class_group"
# First, confirm that the "class_group" variable is a categorical variable
is.factor(Student_Performance_Dataset_imputed$class_group)
# Second, create the visualization

gg_miss_fct(Student_Performance_Dataset_imputed, fct = class_group)

# We can also create a heatmap of "missingness" broken down by "GRADE"
# First, confirm that the "GRADE" variable is a categorical variable
is.factor(Student_Performance_Dataset_imputed$GRADE)
# Second, create the visualization

gg_miss_fct(Student_Performance_Dataset_imputed, fct = GRADE)


