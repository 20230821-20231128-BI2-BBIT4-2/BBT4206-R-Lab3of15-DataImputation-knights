Business Intelligence Project
================
<Knights>
<Specify the date when you submitted the lab>

- [Student Details](#student-details)
- [Setup Chunk](#setup-chunk)
- [Understanding the Dataset (Exploratory Data Analysis
  (EDA))](#understanding-the-dataset-exploratory-data-analysis-eda)
  - [Loading the Dataset](#loading-the-dataset)
    - [Source:](#source)

# Student Details

|                                           |                      |
|-------------------------------------------|----------------------|
| **Student ID Number** && **Student Name** |                      |
| 134834 - Emmanuel Kasio                   | 135356 - Ann Kigera  |
| 122883 - Michelle Guya                    | 136301 - Ian Nyameta |
| 135230 - Peter Aringo                     |                      |

**BBIT 4.2 Group** \| B \|  
**BI Project Group Name/ID (if applicable)** \| Knights \|

# Setup Chunk

**Note:** the following KnitR options have been set as the global
defaults: <BR>
`knitr::opts_chunk$set(echo = TRUE, warning = FALSE, eval = TRUE, collapse = FALSE, tidy = TRUE)`.

More KnitR options are documented here
<https://bookdown.org/yihui/rmarkdown-cookbook/chunk-options.html> and
here <https://yihui.org/knitr/options/>.

# Understanding the Dataset (Exploratory Data Analysis (EDA))

## Loading the Dataset

### Source:

The dataset that was used can be downloaded here: *\<<a
href="https://docs.google.com/spreadsheets/d/1LwVZIklzc0JvyVPQul9CxGnu2spipZjXaCO_Zv8H2sc/edit#gid=2007896421\"
class="uri">https://docs.google.com/spreadsheets/d/1LwVZIklzc0JvyVPQul9CxGnu2spipZjXaCO_Zv8H2sc/edit#gid=2007896421\</a>\>*

``` r
# The code was used to load the dataset;

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
        `Attendance Waiver Granted: 1 = Yes, 0 = No` =
          readr::col_factor(levels = c("0", "1")),
        GRADE = readr::col_factor(levels =
                                    c("A", "B", "C", "D",
                                      "E"))),
    locale = readr::locale())
```

``` r
## This code was used to Install and Load the Required Packages

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
```

``` r
# This code was used to Create a subset of the variables/features

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
```

``` r
#This code was used to generate a Subset of rows

rand_ind <- sample(seq_len(nrow(Student_Performance_Dataset_subset)), 80)
Student_Performance_Dataset_rows <- Student_Performance_Dataset_subset[rand_ind, ]
```

``` r
# Confirm the "missingness" in the Dataset before Imputation
any_na(Student_Performance_Dataset_rows)
```

    ## [1] TRUE

``` r
# The number of missing data entries  
n_miss(Student_Performance_Dataset_rows)
```

    ## [1] 69

``` r
# The percentage of missing data in the entire dataset
prop_miss(Student_Performance_Dataset_rows)
```

    ## [1] 0.01391129

``` r
# The number of missing values in each variable 
Student_Performance_Dataset_rows %>% is.na() %>% colSums()
```

    ##                        class_group                             gender 
    ##                                  0                                  0 
    ##                                YOB                 regret_choosing_bi 
    ##                                  0                                  0 
    ##                        drop_bi_now                          motivator 
    ##                                  0                                  0 
    ##        read_content_before_lecture          anticipate_test_questions 
    ##                                  0                                  0 
    ##        answer_rhetorical_questions           find_terms_I_do_not_know 
    ##                                  0                                  0 
    ## copy_new_terms_in_reading_notebook       take_quizzes_and_use_results 
    ##                                  0                                  0 
    ##          reorganise_course_outline        write_down_important_points 
    ##                                  0                                  0 
    ##                 space_out_revision            studying_in_study_group 
    ##                                  0                                  0 
    ##              schedule_appointments                      goal_oriented 
    ##                                  0                                  0 
    ##                  spaced_repetition          testing_and_active_recall 
    ##                                  0                                  0 
    ##                       interleaving                       categorizing 
    ##                                  0                                  0 
    ##            retrospective_timetable                      cornell_notes 
    ##                                  0                                  0 
    ##                               sq3r                            commute 
    ##                                  0                                  1 
    ##                         study_time                   repeats_since_Y1 
    ##                                  1                                  1 
    ##                       paid_tuition                       free_tuition 
    ##                                  1                                  1 
    ##                   extra_curricular            sports_extra_curricular 
    ##                                  1                                  1 
    ##                  exercise_per_week                           meditate 
    ##                                  1                                  1 
    ##                               pray                           internet 
    ##                                  1                                  1 
    ##                             laptop               family_relationships 
    ##                                  1                                  1 
    ##                        friendships             romantic_relationships 
    ##                                  1                                  1 
    ##                  spiritual_wellnes                 financial_wellness 
    ##                                  1                                  1 
    ##                             health                            day_out 
    ##                                  1                                  1 
    ##                          night_out               alcohol_or_narcotics 
    ##                                  1                                  1 
    ##                             mentor                    mentor_meetings 
    ##                                  1                                  1 
    ##                              GRADE                   Quiz_1_Concept_1 
    ##                                  0                                  0 
    ##                               EXAM                              TOTAL 
    ##                                  0                                  0 
    ##                   Quiz_4_Concept_4            Quizzes_and_Bonus_Marks 
    ##                                  5                                  0 
    ## Lab_4_Linear_Discriminant_Analysis                              CAT_1 
    ##                                 15                                  3 
    ##                              CAT_2             Absenteeism_Percentage 
    ##                                 22                                  0 
    ##                   Coursework_TOTAL     Lab_1_Simple_Linear_Regression 
    ##                                  0                                  1 
    ##                            LabWork          Attendance_Waiver_Granted 
    ##                                  0                                  0

``` r
# The number and percentage of missing values grouped by
# each variable
miss_var_summary(Student_Performance_Dataset_rows)
```

    ## # A tibble: 62 × 3
    ##    variable                           n_miss pct_miss
    ##    <chr>                               <int>    <dbl>
    ##  1 CAT_2                                  22    27.5 
    ##  2 Lab_4_Linear_Discriminant_Analysis     15    18.8 
    ##  3 Quiz_4_Concept_4                        5     6.25
    ##  4 CAT_1                                   3     3.75
    ##  5 commute                                 1     1.25
    ##  6 study_time                              1     1.25
    ##  7 repeats_since_Y1                        1     1.25
    ##  8 paid_tuition                            1     1.25
    ##  9 free_tuition                            1     1.25
    ## 10 extra_curricular                        1     1.25
    ## # ℹ 52 more rows

``` r
# The number and percentage of missing values grouped by
# each observation
miss_case_summary(Student_Performance_Dataset_rows)
```

    ## # A tibble: 80 × 3
    ##     case n_miss pct_miss
    ##    <int>  <int>    <dbl>
    ##  1    29     25    40.3 
    ##  2    40      3     4.84
    ##  3    66      3     4.84
    ##  4     4      2     3.23
    ##  5     8      2     3.23
    ##  6    16      2     3.23
    ##  7    21      2     3.23
    ##  8    28      2     3.23
    ##  9    36      2     3.23
    ## 10    38      2     3.23
    ## # ℹ 70 more rows

``` r
# The variables that contain the most missing values
gg_miss_var(Student_Performance_Dataset_rows)
```

![](BIProject-Template_files/figure-gfm/Your%20Sixth%20Code%20Chunk-1.png)<!-- -->

``` r
# Location of missing values (the shaded regions in the plot)
vis_miss(Student_Performance_Dataset_rows) + theme(axis.text.x = element_text(angle = 80))
```

![](BIProject-Template_files/figure-gfm/Your%20Sixth%20Code%20Chunk-2.png)<!-- -->

``` r
# The combinations of variables that are missing together
gg_miss_upset(Student_Performance_Dataset_rows)
```

![](BIProject-Template_files/figure-gfm/Your%20Sixth%20Code%20Chunk-3.png)<!-- -->

``` r
# A heatmap of "missingness" broken down by "class_group"
# Confirmation that the "class_group" variable is a categorical variable
is.factor(Student_Performance_Dataset_rows$class_group)
```

    ## [1] TRUE

``` r
# Creation of the visualization
gg_miss_fct(Student_Performance_Dataset_rows, fct = class_group)
```

![](BIProject-Template_files/figure-gfm/Your%20Sixth%20Code%20Chunk-4.png)<!-- -->

``` r
# A heatmap of "missingness" broken down by "GRADE"
# Confirmation that the "GRADE" variable is a categorical variable
is.factor(Student_Performance_Dataset_rows$GRADE)
```

    ## [1] TRUE

``` r
# Creation of the visualization
gg_miss_fct(Student_Performance_Dataset_rows, fct = GRADE)
```

![](BIProject-Template_files/figure-gfm/Your%20Sixth%20Code%20Chunk-5.png)<!-- -->

``` r
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

# A higher metal_health rating suggests a positive mental health status whereas a lower one suggest a negative mental health status. 
```

``` r
# To arrive at good predictions for each variable containing missing values, we
# save the variables that are at least "somewhat correlated" (r > 0.3).
somewhat_correlated_variables <- quickpred(Student_Performance_Dataset_rows, mincor = 0.3) # nolint

Student_Performance_Dataset_mice <- mice(Student_Performance_Dataset_rows, m = 11, method = "pmm",
                            seed = 7,
                            predictorMatrix = somewhat_correlated_variables)
```

    ## 
    ##  iter imp variable
    ##   1   1  commute  study_time  repeats_since_Y1  paid_tuition  free_tuition  extra_curricular  sports_extra_curricular  exercise_per_week  meditate  pray  internet  family_relationships  friendships  romantic_relationships  spiritual_wellnes  financial_wellness  health  day_out  night_out  alcohol_or_narcotics  mentor  mentor_meetings  Quiz_4_Concept_4  Lab_4_Linear_Discriminant_Analysis  CAT_1  CAT_2  Lab_1_Simple_Linear_Regression  Mental_Health
    ##   1   2  commute  study_time  repeats_since_Y1  paid_tuition  free_tuition  extra_curricular  sports_extra_curricular  exercise_per_week  meditate  pray  internet  family_relationships  friendships  romantic_relationships  spiritual_wellnes  financial_wellness  health  day_out  night_out  alcohol_or_narcotics  mentor  mentor_meetings  Quiz_4_Concept_4  Lab_4_Linear_Discriminant_Analysis  CAT_1  CAT_2  Lab_1_Simple_Linear_Regression  Mental_Health
    ##   1   3  commute  study_time  repeats_since_Y1  paid_tuition  free_tuition  extra_curricular  sports_extra_curricular  exercise_per_week  meditate  pray  internet  family_relationships  friendships  romantic_relationships  spiritual_wellnes  financial_wellness  health  day_out  night_out  alcohol_or_narcotics  mentor  mentor_meetings  Quiz_4_Concept_4  Lab_4_Linear_Discriminant_Analysis  CAT_1  CAT_2  Lab_1_Simple_Linear_Regression  Mental_Health
    ##   1   4  commute  study_time  repeats_since_Y1  paid_tuition  free_tuition  extra_curricular  sports_extra_curricular  exercise_per_week  meditate  pray  internet  family_relationships  friendships  romantic_relationships  spiritual_wellnes  financial_wellness  health  day_out  night_out  alcohol_or_narcotics  mentor  mentor_meetings  Quiz_4_Concept_4  Lab_4_Linear_Discriminant_Analysis  CAT_1  CAT_2  Lab_1_Simple_Linear_Regression  Mental_Health
    ##   1   5  commute  study_time  repeats_since_Y1  paid_tuition  free_tuition  extra_curricular  sports_extra_curricular  exercise_per_week  meditate  pray  internet  family_relationships  friendships  romantic_relationships  spiritual_wellnes  financial_wellness  health  day_out  night_out  alcohol_or_narcotics  mentor  mentor_meetings  Quiz_4_Concept_4  Lab_4_Linear_Discriminant_Analysis  CAT_1  CAT_2  Lab_1_Simple_Linear_Regression  Mental_Health
    ##   1   6  commute  study_time  repeats_since_Y1  paid_tuition  free_tuition  extra_curricular  sports_extra_curricular  exercise_per_week  meditate  pray  internet  family_relationships  friendships  romantic_relationships  spiritual_wellnes  financial_wellness  health  day_out  night_out  alcohol_or_narcotics  mentor  mentor_meetings  Quiz_4_Concept_4  Lab_4_Linear_Discriminant_Analysis  CAT_1  CAT_2  Lab_1_Simple_Linear_Regression  Mental_Health
    ##   1   7  commute  study_time  repeats_since_Y1  paid_tuition  free_tuition  extra_curricular  sports_extra_curricular  exercise_per_week  meditate  pray  internet  family_relationships  friendships  romantic_relationships  spiritual_wellnes  financial_wellness  health  day_out  night_out  alcohol_or_narcotics  mentor  mentor_meetings  Quiz_4_Concept_4  Lab_4_Linear_Discriminant_Analysis  CAT_1  CAT_2  Lab_1_Simple_Linear_Regression  Mental_Health
    ##   1   8  commute  study_time  repeats_since_Y1  paid_tuition  free_tuition  extra_curricular  sports_extra_curricular  exercise_per_week  meditate  pray  internet  family_relationships  friendships  romantic_relationships  spiritual_wellnes  financial_wellness  health  day_out  night_out  alcohol_or_narcotics  mentor  mentor_meetings  Quiz_4_Concept_4  Lab_4_Linear_Discriminant_Analysis  CAT_1  CAT_2  Lab_1_Simple_Linear_Regression  Mental_Health
    ##   1   9  commute  study_time  repeats_since_Y1  paid_tuition  free_tuition  extra_curricular  sports_extra_curricular  exercise_per_week  meditate  pray  internet  family_relationships  friendships  romantic_relationships  spiritual_wellnes  financial_wellness  health  day_out  night_out  alcohol_or_narcotics  mentor  mentor_meetings  Quiz_4_Concept_4  Lab_4_Linear_Discriminant_Analysis  CAT_1  CAT_2  Lab_1_Simple_Linear_Regression  Mental_Health
    ##   1   10  commute  study_time  repeats_since_Y1  paid_tuition  free_tuition  extra_curricular  sports_extra_curricular  exercise_per_week  meditate  pray  internet  family_relationships  friendships  romantic_relationships  spiritual_wellnes  financial_wellness  health  day_out  night_out  alcohol_or_narcotics  mentor  mentor_meetings  Quiz_4_Concept_4  Lab_4_Linear_Discriminant_Analysis  CAT_1  CAT_2  Lab_1_Simple_Linear_Regression  Mental_Health
    ##   1   11  commute  study_time  repeats_since_Y1  paid_tuition  free_tuition  extra_curricular  sports_extra_curricular  exercise_per_week  meditate  pray  internet  family_relationships  friendships  romantic_relationships  spiritual_wellnes  financial_wellness  health  day_out  night_out  alcohol_or_narcotics  mentor  mentor_meetings  Quiz_4_Concept_4  Lab_4_Linear_Discriminant_Analysis  CAT_1  CAT_2  Lab_1_Simple_Linear_Regression  Mental_Health
    ##   2   1  commute  study_time  repeats_since_Y1  paid_tuition  free_tuition  extra_curricular  sports_extra_curricular  exercise_per_week  meditate  pray  internet  family_relationships  friendships  romantic_relationships  spiritual_wellnes  financial_wellness  health  day_out  night_out  alcohol_or_narcotics  mentor  mentor_meetings  Quiz_4_Concept_4  Lab_4_Linear_Discriminant_Analysis  CAT_1  CAT_2  Lab_1_Simple_Linear_Regression  Mental_Health
    ##   2   2  commute  study_time  repeats_since_Y1  paid_tuition  free_tuition  extra_curricular  sports_extra_curricular  exercise_per_week  meditate  pray  internet  family_relationships  friendships  romantic_relationships  spiritual_wellnes  financial_wellness  health  day_out  night_out  alcohol_or_narcotics  mentor  mentor_meetings  Quiz_4_Concept_4  Lab_4_Linear_Discriminant_Analysis  CAT_1  CAT_2  Lab_1_Simple_Linear_Regression  Mental_Health
    ##   2   3  commute  study_time  repeats_since_Y1  paid_tuition  free_tuition  extra_curricular  sports_extra_curricular  exercise_per_week  meditate  pray  internet  family_relationships  friendships  romantic_relationships  spiritual_wellnes  financial_wellness  health  day_out  night_out  alcohol_or_narcotics  mentor  mentor_meetings  Quiz_4_Concept_4  Lab_4_Linear_Discriminant_Analysis  CAT_1  CAT_2  Lab_1_Simple_Linear_Regression  Mental_Health
    ##   2   4  commute  study_time  repeats_since_Y1  paid_tuition  free_tuition  extra_curricular  sports_extra_curricular  exercise_per_week  meditate  pray  internet  family_relationships  friendships  romantic_relationships  spiritual_wellnes  financial_wellness  health  day_out  night_out  alcohol_or_narcotics  mentor  mentor_meetings  Quiz_4_Concept_4  Lab_4_Linear_Discriminant_Analysis  CAT_1  CAT_2  Lab_1_Simple_Linear_Regression  Mental_Health
    ##   2   5  commute  study_time  repeats_since_Y1  paid_tuition  free_tuition  extra_curricular  sports_extra_curricular  exercise_per_week  meditate  pray  internet  family_relationships  friendships  romantic_relationships  spiritual_wellnes  financial_wellness  health  day_out  night_out  alcohol_or_narcotics  mentor  mentor_meetings  Quiz_4_Concept_4  Lab_4_Linear_Discriminant_Analysis  CAT_1  CAT_2  Lab_1_Simple_Linear_Regression  Mental_Health
    ##   2   6  commute  study_time  repeats_since_Y1  paid_tuition  free_tuition  extra_curricular  sports_extra_curricular  exercise_per_week  meditate  pray  internet  family_relationships  friendships  romantic_relationships  spiritual_wellnes  financial_wellness  health  day_out  night_out  alcohol_or_narcotics  mentor  mentor_meetings  Quiz_4_Concept_4  Lab_4_Linear_Discriminant_Analysis  CAT_1  CAT_2  Lab_1_Simple_Linear_Regression  Mental_Health
    ##   2   7  commute  study_time  repeats_since_Y1  paid_tuition  free_tuition  extra_curricular  sports_extra_curricular  exercise_per_week  meditate  pray  internet  family_relationships  friendships  romantic_relationships  spiritual_wellnes  financial_wellness  health  day_out  night_out  alcohol_or_narcotics  mentor  mentor_meetings  Quiz_4_Concept_4  Lab_4_Linear_Discriminant_Analysis  CAT_1  CAT_2  Lab_1_Simple_Linear_Regression  Mental_Health
    ##   2   8  commute  study_time  repeats_since_Y1  paid_tuition  free_tuition  extra_curricular  sports_extra_curricular  exercise_per_week  meditate  pray  internet  family_relationships  friendships  romantic_relationships  spiritual_wellnes  financial_wellness  health  day_out  night_out  alcohol_or_narcotics  mentor  mentor_meetings  Quiz_4_Concept_4  Lab_4_Linear_Discriminant_Analysis  CAT_1  CAT_2  Lab_1_Simple_Linear_Regression  Mental_Health
    ##   2   9  commute  study_time  repeats_since_Y1  paid_tuition  free_tuition  extra_curricular  sports_extra_curricular  exercise_per_week  meditate  pray  internet  family_relationships  friendships  romantic_relationships  spiritual_wellnes  financial_wellness  health  day_out  night_out  alcohol_or_narcotics  mentor  mentor_meetings  Quiz_4_Concept_4  Lab_4_Linear_Discriminant_Analysis  CAT_1  CAT_2  Lab_1_Simple_Linear_Regression  Mental_Health
    ##   2   10  commute  study_time  repeats_since_Y1  paid_tuition  free_tuition  extra_curricular  sports_extra_curricular  exercise_per_week  meditate  pray  internet  family_relationships  friendships  romantic_relationships  spiritual_wellnes  financial_wellness  health  day_out  night_out  alcohol_or_narcotics  mentor  mentor_meetings  Quiz_4_Concept_4  Lab_4_Linear_Discriminant_Analysis  CAT_1  CAT_2  Lab_1_Simple_Linear_Regression  Mental_Health
    ##   2   11  commute  study_time  repeats_since_Y1  paid_tuition  free_tuition  extra_curricular  sports_extra_curricular  exercise_per_week  meditate  pray  internet  family_relationships  friendships  romantic_relationships  spiritual_wellnes  financial_wellness  health  day_out  night_out  alcohol_or_narcotics  mentor  mentor_meetings  Quiz_4_Concept_4  Lab_4_Linear_Discriminant_Analysis  CAT_1  CAT_2  Lab_1_Simple_Linear_Regression  Mental_Health
    ##   3   1  commute  study_time  repeats_since_Y1  paid_tuition  free_tuition  extra_curricular  sports_extra_curricular  exercise_per_week  meditate  pray  internet  family_relationships  friendships  romantic_relationships  spiritual_wellnes  financial_wellness  health  day_out  night_out  alcohol_or_narcotics  mentor  mentor_meetings  Quiz_4_Concept_4  Lab_4_Linear_Discriminant_Analysis  CAT_1  CAT_2  Lab_1_Simple_Linear_Regression  Mental_Health
    ##   3   2  commute  study_time  repeats_since_Y1  paid_tuition  free_tuition  extra_curricular  sports_extra_curricular  exercise_per_week  meditate  pray  internet  family_relationships  friendships  romantic_relationships  spiritual_wellnes  financial_wellness  health  day_out  night_out  alcohol_or_narcotics  mentor  mentor_meetings  Quiz_4_Concept_4  Lab_4_Linear_Discriminant_Analysis  CAT_1  CAT_2  Lab_1_Simple_Linear_Regression  Mental_Health
    ##   3   3  commute  study_time  repeats_since_Y1  paid_tuition  free_tuition  extra_curricular  sports_extra_curricular  exercise_per_week  meditate  pray  internet  family_relationships  friendships  romantic_relationships  spiritual_wellnes  financial_wellness  health  day_out  night_out  alcohol_or_narcotics  mentor  mentor_meetings  Quiz_4_Concept_4  Lab_4_Linear_Discriminant_Analysis  CAT_1  CAT_2  Lab_1_Simple_Linear_Regression  Mental_Health
    ##   3   4  commute  study_time  repeats_since_Y1  paid_tuition  free_tuition  extra_curricular  sports_extra_curricular  exercise_per_week  meditate  pray  internet  family_relationships  friendships  romantic_relationships  spiritual_wellnes  financial_wellness  health  day_out  night_out  alcohol_or_narcotics  mentor  mentor_meetings  Quiz_4_Concept_4  Lab_4_Linear_Discriminant_Analysis  CAT_1  CAT_2  Lab_1_Simple_Linear_Regression  Mental_Health
    ##   3   5  commute  study_time  repeats_since_Y1  paid_tuition  free_tuition  extra_curricular  sports_extra_curricular  exercise_per_week  meditate  pray  internet  family_relationships  friendships  romantic_relationships  spiritual_wellnes  financial_wellness  health  day_out  night_out  alcohol_or_narcotics  mentor  mentor_meetings  Quiz_4_Concept_4  Lab_4_Linear_Discriminant_Analysis  CAT_1  CAT_2  Lab_1_Simple_Linear_Regression  Mental_Health
    ##   3   6  commute  study_time  repeats_since_Y1  paid_tuition  free_tuition  extra_curricular  sports_extra_curricular  exercise_per_week  meditate  pray  internet  family_relationships  friendships  romantic_relationships  spiritual_wellnes  financial_wellness  health  day_out  night_out  alcohol_or_narcotics  mentor  mentor_meetings  Quiz_4_Concept_4  Lab_4_Linear_Discriminant_Analysis  CAT_1  CAT_2  Lab_1_Simple_Linear_Regression  Mental_Health
    ##   3   7  commute  study_time  repeats_since_Y1  paid_tuition  free_tuition  extra_curricular  sports_extra_curricular  exercise_per_week  meditate  pray  internet  family_relationships  friendships  romantic_relationships  spiritual_wellnes  financial_wellness  health  day_out  night_out  alcohol_or_narcotics  mentor  mentor_meetings  Quiz_4_Concept_4  Lab_4_Linear_Discriminant_Analysis  CAT_1  CAT_2  Lab_1_Simple_Linear_Regression  Mental_Health
    ##   3   8  commute  study_time  repeats_since_Y1  paid_tuition  free_tuition  extra_curricular  sports_extra_curricular  exercise_per_week  meditate  pray  internet  family_relationships  friendships  romantic_relationships  spiritual_wellnes  financial_wellness  health  day_out  night_out  alcohol_or_narcotics  mentor  mentor_meetings  Quiz_4_Concept_4  Lab_4_Linear_Discriminant_Analysis  CAT_1  CAT_2  Lab_1_Simple_Linear_Regression  Mental_Health
    ##   3   9  commute  study_time  repeats_since_Y1  paid_tuition  free_tuition  extra_curricular  sports_extra_curricular  exercise_per_week  meditate  pray  internet  family_relationships  friendships  romantic_relationships  spiritual_wellnes  financial_wellness  health  day_out  night_out  alcohol_or_narcotics  mentor  mentor_meetings  Quiz_4_Concept_4  Lab_4_Linear_Discriminant_Analysis  CAT_1  CAT_2  Lab_1_Simple_Linear_Regression  Mental_Health
    ##   3   10  commute  study_time  repeats_since_Y1  paid_tuition  free_tuition  extra_curricular  sports_extra_curricular  exercise_per_week  meditate  pray  internet  family_relationships  friendships  romantic_relationships  spiritual_wellnes  financial_wellness  health  day_out  night_out  alcohol_or_narcotics  mentor  mentor_meetings  Quiz_4_Concept_4  Lab_4_Linear_Discriminant_Analysis  CAT_1  CAT_2  Lab_1_Simple_Linear_Regression  Mental_Health
    ##   3   11  commute  study_time  repeats_since_Y1  paid_tuition  free_tuition  extra_curricular  sports_extra_curricular  exercise_per_week  meditate  pray  internet  family_relationships  friendships  romantic_relationships  spiritual_wellnes  financial_wellness  health  day_out  night_out  alcohol_or_narcotics  mentor  mentor_meetings  Quiz_4_Concept_4  Lab_4_Linear_Discriminant_Analysis  CAT_1  CAT_2  Lab_1_Simple_Linear_Regression  Mental_Health
    ##   4   1  commute  study_time  repeats_since_Y1  paid_tuition  free_tuition  extra_curricular  sports_extra_curricular  exercise_per_week  meditate  pray  internet  family_relationships  friendships  romantic_relationships  spiritual_wellnes  financial_wellness  health  day_out  night_out  alcohol_or_narcotics  mentor  mentor_meetings  Quiz_4_Concept_4  Lab_4_Linear_Discriminant_Analysis  CAT_1  CAT_2  Lab_1_Simple_Linear_Regression  Mental_Health
    ##   4   2  commute  study_time  repeats_since_Y1  paid_tuition  free_tuition  extra_curricular  sports_extra_curricular  exercise_per_week  meditate  pray  internet  family_relationships  friendships  romantic_relationships  spiritual_wellnes  financial_wellness  health  day_out  night_out  alcohol_or_narcotics  mentor  mentor_meetings  Quiz_4_Concept_4  Lab_4_Linear_Discriminant_Analysis  CAT_1  CAT_2  Lab_1_Simple_Linear_Regression  Mental_Health
    ##   4   3  commute  study_time  repeats_since_Y1  paid_tuition  free_tuition  extra_curricular  sports_extra_curricular  exercise_per_week  meditate  pray  internet  family_relationships  friendships  romantic_relationships  spiritual_wellnes  financial_wellness  health  day_out  night_out  alcohol_or_narcotics  mentor  mentor_meetings  Quiz_4_Concept_4  Lab_4_Linear_Discriminant_Analysis  CAT_1  CAT_2  Lab_1_Simple_Linear_Regression  Mental_Health
    ##   4   4  commute  study_time  repeats_since_Y1  paid_tuition  free_tuition  extra_curricular  sports_extra_curricular  exercise_per_week  meditate  pray  internet  family_relationships  friendships  romantic_relationships  spiritual_wellnes  financial_wellness  health  day_out  night_out  alcohol_or_narcotics  mentor  mentor_meetings  Quiz_4_Concept_4  Lab_4_Linear_Discriminant_Analysis  CAT_1  CAT_2  Lab_1_Simple_Linear_Regression  Mental_Health
    ##   4   5  commute  study_time  repeats_since_Y1  paid_tuition  free_tuition  extra_curricular  sports_extra_curricular  exercise_per_week  meditate  pray  internet  family_relationships  friendships  romantic_relationships  spiritual_wellnes  financial_wellness  health  day_out  night_out  alcohol_or_narcotics  mentor  mentor_meetings  Quiz_4_Concept_4  Lab_4_Linear_Discriminant_Analysis  CAT_1  CAT_2  Lab_1_Simple_Linear_Regression  Mental_Health
    ##   4   6  commute  study_time  repeats_since_Y1  paid_tuition  free_tuition  extra_curricular  sports_extra_curricular  exercise_per_week  meditate  pray  internet  family_relationships  friendships  romantic_relationships  spiritual_wellnes  financial_wellness  health  day_out  night_out  alcohol_or_narcotics  mentor  mentor_meetings  Quiz_4_Concept_4  Lab_4_Linear_Discriminant_Analysis  CAT_1  CAT_2  Lab_1_Simple_Linear_Regression  Mental_Health
    ##   4   7  commute  study_time  repeats_since_Y1  paid_tuition  free_tuition  extra_curricular  sports_extra_curricular  exercise_per_week  meditate  pray  internet  family_relationships  friendships  romantic_relationships  spiritual_wellnes  financial_wellness  health  day_out  night_out  alcohol_or_narcotics  mentor  mentor_meetings  Quiz_4_Concept_4  Lab_4_Linear_Discriminant_Analysis  CAT_1  CAT_2  Lab_1_Simple_Linear_Regression  Mental_Health
    ##   4   8  commute  study_time  repeats_since_Y1  paid_tuition  free_tuition  extra_curricular  sports_extra_curricular  exercise_per_week  meditate  pray  internet  family_relationships  friendships  romantic_relationships  spiritual_wellnes  financial_wellness  health  day_out  night_out  alcohol_or_narcotics  mentor  mentor_meetings  Quiz_4_Concept_4  Lab_4_Linear_Discriminant_Analysis  CAT_1  CAT_2  Lab_1_Simple_Linear_Regression  Mental_Health
    ##   4   9  commute  study_time  repeats_since_Y1  paid_tuition  free_tuition  extra_curricular  sports_extra_curricular  exercise_per_week  meditate  pray  internet  family_relationships  friendships  romantic_relationships  spiritual_wellnes  financial_wellness  health  day_out  night_out  alcohol_or_narcotics  mentor  mentor_meetings  Quiz_4_Concept_4  Lab_4_Linear_Discriminant_Analysis  CAT_1  CAT_2  Lab_1_Simple_Linear_Regression  Mental_Health
    ##   4   10  commute  study_time  repeats_since_Y1  paid_tuition  free_tuition  extra_curricular  sports_extra_curricular  exercise_per_week  meditate  pray  internet  family_relationships  friendships  romantic_relationships  spiritual_wellnes  financial_wellness  health  day_out  night_out  alcohol_or_narcotics  mentor  mentor_meetings  Quiz_4_Concept_4  Lab_4_Linear_Discriminant_Analysis  CAT_1  CAT_2  Lab_1_Simple_Linear_Regression  Mental_Health
    ##   4   11  commute  study_time  repeats_since_Y1  paid_tuition  free_tuition  extra_curricular  sports_extra_curricular  exercise_per_week  meditate  pray  internet  family_relationships  friendships  romantic_relationships  spiritual_wellnes  financial_wellness  health  day_out  night_out  alcohol_or_narcotics  mentor  mentor_meetings  Quiz_4_Concept_4  Lab_4_Linear_Discriminant_Analysis  CAT_1  CAT_2  Lab_1_Simple_Linear_Regression  Mental_Health
    ##   5   1  commute  study_time  repeats_since_Y1  paid_tuition  free_tuition  extra_curricular  sports_extra_curricular  exercise_per_week  meditate  pray  internet  family_relationships  friendships  romantic_relationships  spiritual_wellnes  financial_wellness  health  day_out  night_out  alcohol_or_narcotics  mentor  mentor_meetings  Quiz_4_Concept_4  Lab_4_Linear_Discriminant_Analysis  CAT_1  CAT_2  Lab_1_Simple_Linear_Regression  Mental_Health
    ##   5   2  commute  study_time  repeats_since_Y1  paid_tuition  free_tuition  extra_curricular  sports_extra_curricular  exercise_per_week  meditate  pray  internet  family_relationships  friendships  romantic_relationships  spiritual_wellnes  financial_wellness  health  day_out  night_out  alcohol_or_narcotics  mentor  mentor_meetings  Quiz_4_Concept_4  Lab_4_Linear_Discriminant_Analysis  CAT_1  CAT_2  Lab_1_Simple_Linear_Regression  Mental_Health
    ##   5   3  commute  study_time  repeats_since_Y1  paid_tuition  free_tuition  extra_curricular  sports_extra_curricular  exercise_per_week  meditate  pray  internet  family_relationships  friendships  romantic_relationships  spiritual_wellnes  financial_wellness  health  day_out  night_out  alcohol_or_narcotics  mentor  mentor_meetings  Quiz_4_Concept_4  Lab_4_Linear_Discriminant_Analysis  CAT_1  CAT_2  Lab_1_Simple_Linear_Regression  Mental_Health
    ##   5   4  commute  study_time  repeats_since_Y1  paid_tuition  free_tuition  extra_curricular  sports_extra_curricular  exercise_per_week  meditate  pray  internet  family_relationships  friendships  romantic_relationships  spiritual_wellnes  financial_wellness  health  day_out  night_out  alcohol_or_narcotics  mentor  mentor_meetings  Quiz_4_Concept_4  Lab_4_Linear_Discriminant_Analysis  CAT_1  CAT_2  Lab_1_Simple_Linear_Regression  Mental_Health
    ##   5   5  commute  study_time  repeats_since_Y1  paid_tuition  free_tuition  extra_curricular  sports_extra_curricular  exercise_per_week  meditate  pray  internet  family_relationships  friendships  romantic_relationships  spiritual_wellnes  financial_wellness  health  day_out  night_out  alcohol_or_narcotics  mentor  mentor_meetings  Quiz_4_Concept_4  Lab_4_Linear_Discriminant_Analysis  CAT_1  CAT_2  Lab_1_Simple_Linear_Regression  Mental_Health
    ##   5   6  commute  study_time  repeats_since_Y1  paid_tuition  free_tuition  extra_curricular  sports_extra_curricular  exercise_per_week  meditate  pray  internet  family_relationships  friendships  romantic_relationships  spiritual_wellnes  financial_wellness  health  day_out  night_out  alcohol_or_narcotics  mentor  mentor_meetings  Quiz_4_Concept_4  Lab_4_Linear_Discriminant_Analysis  CAT_1  CAT_2  Lab_1_Simple_Linear_Regression  Mental_Health
    ##   5   7  commute  study_time  repeats_since_Y1  paid_tuition  free_tuition  extra_curricular  sports_extra_curricular  exercise_per_week  meditate  pray  internet  family_relationships  friendships  romantic_relationships  spiritual_wellnes  financial_wellness  health  day_out  night_out  alcohol_or_narcotics  mentor  mentor_meetings  Quiz_4_Concept_4  Lab_4_Linear_Discriminant_Analysis  CAT_1  CAT_2  Lab_1_Simple_Linear_Regression  Mental_Health
    ##   5   8  commute  study_time  repeats_since_Y1  paid_tuition  free_tuition  extra_curricular  sports_extra_curricular  exercise_per_week  meditate  pray  internet  family_relationships  friendships  romantic_relationships  spiritual_wellnes  financial_wellness  health  day_out  night_out  alcohol_or_narcotics  mentor  mentor_meetings  Quiz_4_Concept_4  Lab_4_Linear_Discriminant_Analysis  CAT_1  CAT_2  Lab_1_Simple_Linear_Regression  Mental_Health
    ##   5   9  commute  study_time  repeats_since_Y1  paid_tuition  free_tuition  extra_curricular  sports_extra_curricular  exercise_per_week  meditate  pray  internet  family_relationships  friendships  romantic_relationships  spiritual_wellnes  financial_wellness  health  day_out  night_out  alcohol_or_narcotics  mentor  mentor_meetings  Quiz_4_Concept_4  Lab_4_Linear_Discriminant_Analysis  CAT_1  CAT_2  Lab_1_Simple_Linear_Regression  Mental_Health
    ##   5   10  commute  study_time  repeats_since_Y1  paid_tuition  free_tuition  extra_curricular  sports_extra_curricular  exercise_per_week  meditate  pray  internet  family_relationships  friendships  romantic_relationships  spiritual_wellnes  financial_wellness  health  day_out  night_out  alcohol_or_narcotics  mentor  mentor_meetings  Quiz_4_Concept_4  Lab_4_Linear_Discriminant_Analysis  CAT_1  CAT_2  Lab_1_Simple_Linear_Regression  Mental_Health
    ##   5   11  commute  study_time  repeats_since_Y1  paid_tuition  free_tuition  extra_curricular  sports_extra_curricular  exercise_per_week  meditate  pray  internet  family_relationships  friendships  romantic_relationships  spiritual_wellnes  financial_wellness  health  day_out  night_out  alcohol_or_narcotics  mentor  mentor_meetings  Quiz_4_Concept_4  Lab_4_Linear_Discriminant_Analysis  CAT_1  CAT_2  Lab_1_Simple_Linear_Regression  Mental_Health

``` r
# One can then train a model to predict Mental_Health using family_relationships and exercise_per_week
# or to identify the p-Value and confidence intervals between Mental_Health and family_relationships and
# exercise_per_week

# Using multiple scatter plots (a.k.a. strip-plots) to visualize how
# random the imputed data is in each of the 11 datasets.
stripplot(Student_Performance_Dataset_mice,
          Mental_Health ~ family_relationships | .imp,
          pch = 20, cex = 1)
```

![](BIProject-Template_files/figure-gfm/Your%20Eigth%20Code%20Chunk-1.png)<!-- -->

``` r
stripplot(Student_Performance_Dataset_mice,
          Mental_Health ~ exercise_per_week | .imp,
          pch = 20, cex = 1)
```

![](BIProject-Template_files/figure-gfm/Your%20Eigth%20Code%20Chunk-2.png)<!-- -->

``` r
# Create imputed data for the final dataset using the mice::complete()
# function in the mice package to fill in the missing data.
Student_Performance_Dataset_imputed <- mice::complete(Student_Performance_Dataset_mice, 1)
```

``` r
# Confirmation that the dataset has no more missing values in any feature:
miss_var_summary(Student_Performance_Dataset_imputed)
```

    ## # A tibble: 63 × 3
    ##    variable                    n_miss pct_miss
    ##    <chr>                        <int>    <dbl>
    ##  1 laptop                           1     1.25
    ##  2 class_group                      0     0   
    ##  3 gender                           0     0   
    ##  4 YOB                              0     0   
    ##  5 regret_choosing_bi               0     0   
    ##  6 drop_bi_now                      0     0   
    ##  7 motivator                        0     0   
    ##  8 read_content_before_lecture      0     0   
    ##  9 anticipate_test_questions        0     0   
    ## 10 answer_rhetorical_questions      0     0   
    ## # ℹ 53 more rows

``` r
# A visual confirmation that the dataset has no more missing values in any
# feature:
Amelia::missmap(Student_Performance_Dataset_imputed)
```

![](BIProject-Template_files/figure-gfm/Your%20Tenth%20Code%20Chunk-1.png)<!-- -->

``` r
#########################
# Checking for missing values in the dataset
any_na(Student_Performance_Dataset_imputed)
```

    ## [1] TRUE

``` r
# How many?
n_miss(Student_Performance_Dataset_imputed)
```

    ## [1] 1

``` r
# Checking for percentage of missing data in the entire dataset
prop_miss(Student_Performance_Dataset_imputed)
```

    ## [1] 0.0001984127

``` r
# Checking the number of missing values does each variable has
Student_Performance_Dataset_imputed %>% is.na() %>% colSums()
```

    ##                        class_group                             gender 
    ##                                  0                                  0 
    ##                                YOB                 regret_choosing_bi 
    ##                                  0                                  0 
    ##                        drop_bi_now                          motivator 
    ##                                  0                                  0 
    ##        read_content_before_lecture          anticipate_test_questions 
    ##                                  0                                  0 
    ##        answer_rhetorical_questions           find_terms_I_do_not_know 
    ##                                  0                                  0 
    ## copy_new_terms_in_reading_notebook       take_quizzes_and_use_results 
    ##                                  0                                  0 
    ##          reorganise_course_outline        write_down_important_points 
    ##                                  0                                  0 
    ##                 space_out_revision            studying_in_study_group 
    ##                                  0                                  0 
    ##              schedule_appointments                      goal_oriented 
    ##                                  0                                  0 
    ##                  spaced_repetition          testing_and_active_recall 
    ##                                  0                                  0 
    ##                       interleaving                       categorizing 
    ##                                  0                                  0 
    ##            retrospective_timetable                      cornell_notes 
    ##                                  0                                  0 
    ##                               sq3r                            commute 
    ##                                  0                                  0 
    ##                         study_time                   repeats_since_Y1 
    ##                                  0                                  0 
    ##                       paid_tuition                       free_tuition 
    ##                                  0                                  0 
    ##                   extra_curricular            sports_extra_curricular 
    ##                                  0                                  0 
    ##                  exercise_per_week                           meditate 
    ##                                  0                                  0 
    ##                               pray                           internet 
    ##                                  0                                  0 
    ##                             laptop               family_relationships 
    ##                                  1                                  0 
    ##                        friendships             romantic_relationships 
    ##                                  0                                  0 
    ##                  spiritual_wellnes                 financial_wellness 
    ##                                  0                                  0 
    ##                             health                            day_out 
    ##                                  0                                  0 
    ##                          night_out               alcohol_or_narcotics 
    ##                                  0                                  0 
    ##                             mentor                    mentor_meetings 
    ##                                  0                                  0 
    ##                              GRADE                   Quiz_1_Concept_1 
    ##                                  0                                  0 
    ##                               EXAM                              TOTAL 
    ##                                  0                                  0 
    ##                   Quiz_4_Concept_4            Quizzes_and_Bonus_Marks 
    ##                                  0                                  0 
    ## Lab_4_Linear_Discriminant_Analysis                              CAT_1 
    ##                                  0                                  0 
    ##                              CAT_2             Absenteeism_Percentage 
    ##                                  0                                  0 
    ##                   Coursework_TOTAL     Lab_1_Simple_Linear_Regression 
    ##                                  0                                  0 
    ##                            LabWork          Attendance_Waiver_Granted 
    ##                                  0                                  0 
    ##                      Mental_Health 
    ##                                  0

``` r
# Checking the number and percentage of missing values grouped by
# each variable
miss_var_summary(Student_Performance_Dataset_imputed)
```

    ## # A tibble: 63 × 3
    ##    variable                    n_miss pct_miss
    ##    <chr>                        <int>    <dbl>
    ##  1 laptop                           1     1.25
    ##  2 class_group                      0     0   
    ##  3 gender                           0     0   
    ##  4 YOB                              0     0   
    ##  5 regret_choosing_bi               0     0   
    ##  6 drop_bi_now                      0     0   
    ##  7 motivator                        0     0   
    ##  8 read_content_before_lecture      0     0   
    ##  9 anticipate_test_questions        0     0   
    ## 10 answer_rhetorical_questions      0     0   
    ## # ℹ 53 more rows

``` r
# Checking the number and percentage of missing values grouped by
# each observation
miss_case_summary(Student_Performance_Dataset_imputed)
```

    ## # A tibble: 80 × 3
    ##     case n_miss pct_miss
    ##    <int>  <int>    <dbl>
    ##  1    29      1     1.59
    ##  2     1      0     0   
    ##  3     2      0     0   
    ##  4     3      0     0   
    ##  5     4      0     0   
    ##  6     5      0     0   
    ##  7     6      0     0   
    ##  8     7      0     0   
    ##  9     8      0     0   
    ## 10     9      0     0   
    ## # ℹ 70 more rows

``` r
# Checking for which variables contain the most missing values
gg_miss_var(Student_Performance_Dataset_imputed)
```

![](BIProject-Template_files/figure-gfm/Your%20Tenth%20Code%20Chunk-2.png)<!-- -->

``` r
# Checking where are missing values located (the shaded regions in the plot)
vis_miss(Student_Performance_Dataset_imputed) + theme(axis.text.x = element_text(angle = 80))
```

![](BIProject-Template_files/figure-gfm/Your%20Tenth%20Code%20Chunk-3.png)<!-- -->

``` r
# Checking for which combinations of variables are missing together

# Note: The following command should give you an error stating that at least 2
# variables should have missing data for the plot to be created.
### gg_miss_upset(Student_Performance_Dataset_imputed)

# A heatmap of "missingness" broken down by "class_group"
# Confirmation that the "class_group" variable is a categorical variable
is.factor(Student_Performance_Dataset_imputed$class_group)
```

    ## [1] TRUE

``` r
# Creation of the visualization

gg_miss_fct(Student_Performance_Dataset_imputed, fct = class_group)
```

![](BIProject-Template_files/figure-gfm/Your%20Tenth%20Code%20Chunk-4.png)<!-- -->

``` r
# A heatmap of "missingness" broken down by "GRADE"
# Confirmation that the "GRADE" variable is a categorical variable
is.factor(Student_Performance_Dataset_imputed$GRADE)
```

    ## [1] TRUE

``` r
# Creation of the visualization

gg_miss_fct(Student_Performance_Dataset_imputed, fct = GRADE)
```

![](BIProject-Template_files/figure-gfm/Your%20Tenth%20Code%20Chunk-5.png)<!-- -->
