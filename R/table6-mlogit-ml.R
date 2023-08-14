# ******************************************************************************
# Source code for:
# Produce Table 6 - Appendix: Multinomial Logit Estimation 
# using Maximum Likelihood
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


# Model estimation ----
# ______________________________________________________________________________

# Skip this section if estimation was done and saved to rds

## Model 0 ----
## Null model or intercept only
mdl0 <- brmultinom(overc3c ~ 1,
                   data = dta,
                   type = "ML")

saveRDS(mdl0, file = here("rds","mlogit-ml-0.rds"))

## Model 1 ----
## only socio-demographic explanatory
mdl1 <-
  brmultinom(
    overc3c ~ econstressor + econadaptp + marrdur + dualearn + educmat +
      nmember + dratio + wealthidx + migrant,
    data = dta,
    type = "ML"
  )

saveRDS(mdl1, file = here("rds","mlogit-ml-1.rds"))

## Model 2 ----
## socio-demographic + social assistance
mdl2 <-
  brmultinom(
    overc3c ~ econstressor + econadaptp + marrdur + dualearn + educmat +
      nmember + dratio + wealthidx + migrant +
      ncashassist + cashassist + subassist,
    data = dta,
    type = "ML"
  )

saveRDS(mdl2, file = here("rds","mlogit-ml-2.rds"))

## Model 3 ----
## socio-demographic + social assistance + family organisational
mdl3 <-
  brmultinom(
    overc3c ~ econstressor + econadaptp + marrdur + dualearn + educmat +
      nmember + dratio + wealthidx + migrant +
      ncashassist + cashassist + subassist +
      frole + finterq + cominsup + haverole + praise + nosmoker,
    data = dta,
    type = "ML"
  )

saveRDS(mdl3, file = here("rds","mlogit-ml-3.rds"))

rm(mdl0, mdl1, mdl2, mdl3)


# Report & Export ----

## Read model from rds ----
mdl0 <- readRDS(here("rds","mlogit-ml-0.rds"))
mdl1 <- readRDS(here("rds","mlogit-ml-1.rds"))
mdl2 <- readRDS(here("rds","mlogit-ml-2.rds"))
mdl3 <- readRDS(here("rds","mlogit-ml-3.rds"))

## Model summary ----
summary(mdl1)
summary(mdl2)
summary(mdl3)

## Export to excel ----
## To produce Table 6 [Appendix], construct table manually after output exported to excel
estimates <- bind_rows(
  get_estimates(mdl1) %>% mutate(model = "Model 1"),
  get_estimates(mdl2) %>% mutate(model = "Model 2"),
  get_estimates(mdl3) %>% mutate(model = "Model 3")
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
    file = here("tables","ml-estimates.xlsx"),
    sheetName = "coef",
    showNA = FALSE,
    row.names = FALSE
  )

##-rrr
estimates %>%
  mutate_at(vars(contains("estimate")), exp) %>%
  as.data.frame() %>%
  write.xlsx(
    .,
    file = here("tables","ml-estimates.xlsx"),
    sheetName = "rrr",
    showNA = FALSE,
    row.names = FALSE,
    append = TRUE
  )

rm(estimates)

## Model comparison ----

### vs null (simultaneous test) ----
anova(mdl0, mdl1, test = "Chisq")
anova(mdl0, mdl2, test = "Chisq")
anova(mdl0, mdl3, test = "Chisq")

### Subsequent ----
anova(mdl1, mdl2, test = "Chisq")
anova(mdl2, mdl3, test = "Chisq")

## GoF ----
pscl::pR2(mdl1)
pscl::pR2(mdl2)
pscl::pR2(mdl3)