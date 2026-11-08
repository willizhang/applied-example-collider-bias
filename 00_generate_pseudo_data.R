### 1. Load Packages

library(tidyverse)
library(naniar)


### 2. Generate Synthetic Pseudo-Dataset

# This synthetic dataset is generated solely to demonstrate the analysis code.
# The sample size, variable distributions, associations, and missing-data
# patterns are arbitrary and do not represent those in the original SPHC data.

set.seed(20261108)

n <- 15000

d_2010_selected_pseudo <- tibble(
  
  sexual_identity_2010 = factor(
    sample(
      c("Heterosexual", "Non-heterosexual"),
      size = n,
      replace = TRUE,
      prob = c(0.7, 0.3)
    ),
    levels = c("Heterosexual", "Non-heterosexual")
  ),
  
  sexual_identity_2014 = factor(
    sample(
      c("Heterosexual", "Non-heterosexual"),
      size = n,
      replace = TRUE,
      prob = c(0.7, 0.3)
    ),
    levels = c("Heterosexual", "Non-heterosexual")
  ),
  
  age_2010 = sample(
    25:45,
    size = n,
    replace = TRUE
  ),
  
  sex = factor(
    sample(
      c("Male", "Female"),
      size = n,
      replace = TRUE
    ),
    levels = c("Male", "Female")
  ),
  
  country_of_birth = factor(
    sample(
      c("Sweden", "Europe", "Outside Europe"),
      size = n,
      replace = TRUE
    ),
    levels = c("Sweden", "Europe", "Outside Europe")
  ),
  
  income_2010 = factor(
    sample(
      c("<=2,500", "(2,500, 3,500]", "(3,500, 4,500]", ">4,500"),
      size = n,
      replace = TRUE
    ),
    levels = c("<=2,500", "(2,500, 3,500]", "(3,500, 4,500]", ">4,500"),
    ordered = TRUE
  ),
  
  antidepressant_use_2010 = factor(
    sample(
      c("No", "Yes"),
      size = n,
      replace = TRUE
    ),
    levels = c("No", "Yes")
  ),
  
  anxiolytic_use_2010 = factor(
    sample(
      c("No", "Yes"),
      size = n,
      replace = TRUE
    ),
    levels = c("No", "Yes")
  )
)


# Introduce missingness

d_2010_selected_pseudo$sexual_identity_2014[
  sample(seq_len(n), size = 5000)
] <- NA

d_2010_selected_pseudo$income_2010[
  sample(seq_len(n), size = 4000)
] <- NA


# Create identity-change variable

d_2010_selected_pseudo <- d_2010_selected_pseudo %>%
  mutate(
    identity_change = as.numeric(
      sexual_identity_2010 != sexual_identity_2014
    )
  )


### 3. Check Pseudo-Dataset

str(d_2010_selected_pseudo)

summary(d_2010_selected_pseudo)

miss_var_summary(d_2010_selected_pseudo)

