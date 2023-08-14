# ******************************************************************************
# Source code for:
# Produce Table 7 - Appendix: Model comparison after added role in the family 
# and other family organizational as predictor
#
# of The Paper:
# "Understanding the Resilience of garment workers’ Families through 
# a mixed-methods Approach: Surviving the economic hardship during 
# the COVID-19 Pandemic in Indonesia"
#
# Date of this version:
# 2023-08-14
#
# Maintainer of the code: Ari Purwanto Sarwo Prasojo
# ORCID: https://orcid.org/0000-0002-4862-5523
# Institution: Research Center for Population, National Research & Innovation
#              Agency Republic of Indonesia
# Email1: arip003@brin.go.id
# Email2: ari.prasojo18@gmail.com
# Github: https://github.com/aripurwantosp
# ******************************************************************************


rm(list=ls())
gc()


# Library ----
# ______________________________________________________________________________

# Install package if needed
# install.packages(c("haven,"tidyverse","tidyr","brglm2",
#                     "modelsummary","pscl","xlsx,"here"))

library(haven)
library(tidyverse)
library(tidyr)
library(brglm2)
library(modelsummary)
library(xlsx)
library(here)



# Read data ----
# ______________________________________________________________________________

dta0 <- readRDS(here("data","fcrs21_subset.rds"))
dta <- dta0 %>%
  as_factor(.)
glimpse(dta)



# Read model from rds ----
# ______________________________________________________________________________

mdl0 <- readRDS(here("rds","mlogit-0.rds"))
mdl2 <- readRDS(here("rds","mlogit-2.rds"))

# Subsequent model 3 ----
#model 3
mdl3a <- update(mdl2, . ~ . + frole) # model3a
mdl3b <- update(mdl3a, . ~ . + 
                  finterq + cominsup + haverole + praise + nosmoker) #model 3b



# Model comparison ----
# ______________________________________________________________________________

## vs null (simultaneous test) ----
anova(mdl0, mdl2, test = "Chisq")
anova(mdl0, mdl3a, test = "Chisq")
anova(mdl0, mdl3b, test = "Chisq")

## Subsequent ----
anova(mdl2, mdl3a, test = "Chisq")

anova(mdl2, mdl3b, test = "Chisq")
anova(mdl3a, mdl3b, test = "Chisq")

## GoF ----
pscl::pR2(mdl3a)
pscl::pR2(mdl3b)


# Export to excel ----
# To produce Table 7, construct table manually after output exported to excel
# ______________________________________________________________________________
estimates <- bind_rows(
  get_estimates(mdl2) %>% mutate(model = "Model 2"),
  get_estimates(mdl3a) %>% mutate(model = "Model 3a"),
  get_estimates(mdl3b) %>% mutate(model = "Model 3b")
) %>%
  mutate(mdlresp = paste0(model, "_", response)) %>%
  select(term, estimate, "std.error", "p.value", mdlresp) %>%
  pivot_wider(names_from = mdlresp,
              values_from = c(estimate, `std.error`, `p.value`))

## coefficient
estimates %>%
  as.data.frame() %>%
  write.xlsx(
    .,
    file = here("tables","model-comparison-added-role-in-the-family.xlsx"),
    sheetName = "coef",
    showNA = FALSE,
    row.names = FALSE
  )

## rrr
estimates %>%
  mutate_at(vars(contains("estimate")), exp) %>%
  as.data.frame() %>%
  write.xlsx(
    .,
    file = here("tables","model-comparison-added-role-in-the-family.xlsx"),
    sheetName = "rrr",
    showNA = FALSE,
    row.names = FALSE
  )

rm(estimates)