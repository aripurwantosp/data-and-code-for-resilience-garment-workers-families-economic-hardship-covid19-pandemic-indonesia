## Data and code for performing quantitative analyses for "Resilience of garment workers' Families and economic hardship during the COVID-19 Pandemic in Indonesia"

**Information on related paper**

**Title**: Understanding the Resilience of garment workers' Families
through a mixed-methods Approach: Surviving the economic hardship during
the COVID-19 Pandemic in Indonesia [In Review]

**Abstract**: The Covid-19 pandemic has exerted enormous economic
stressors on garment workers in the form of income decline, furlough,
and lay-offs, and these in turn affected their families. However,
research on family resilience among garment workers is limited,
particularly in Indonesia. This study examines the factors associated
with the resilience of garment workers' families. Using a complementary
mixed-methods approach, we analysed data from the 2021 Family and
Community Resilience Survey. We also perfomed 23 in-depth interviews,
and two focus group discussions in Bogor and Bandung Regencies to enrich
the study. We assess family resilience as their current status in
resolving their most disruptive stressor. We fitted a multinomial
logistic regression model and assessed the relative variable importance,
with sociodemographic characteristics, social assistance, and family
organizational factors as groups of explanatory variables. Less than
half of the families (46.67%) were able to overcome their most
significant stressor. Regression analysis shows that wealth index, cash
assistance, and role in the family are the three most contributing
variables. Qualitative results underscore the importance economic
resources or access to cash assistance during the Covid-19 pandemic.
However, reliance on Emok Bank or other informal lenders can also create
new stressors due to their high-interest rates. This option is common
among the garment workers, who usually cannot access the government's
assistance as many are migrants. The study emphasize the need to
strengthen formal social protection systems, especially for vulnerable
populations like garment workers to protect them from future crises.

**List of files in this repository**:

| Filename                                                                                               | Description                                                                   |
|-----------------------------------------|-------------------------------|
| Readme.md [Readme.html]                                                                                | Information about this repository.                                            |
| data-&-code-for-resilience-garment-workers-families-economic-hardship-covid19-pandemic-indonesia.Rproj | .Rproj file, open project in RStudio.                                         |
| data\\                                                                                                 | Folder with data for modeling multinomial logistic regression in .rds format. |
| figures\\                                                                                              | Folder which contain plotted figures in .png format.                          |
| R\\                                                                                                    | Folder with r syntax to perform the analysis.                                 |
| rds\\                                                                                                  | Folder with multinomial logitic regression object in .rds format.             |
| tables\\                                                                                               | Folder with exported model estimation output in .xlsx format.                 |

### R session information for replication

``` r
> sessionInfo()
R version 4.2.1 (2022-06-23 ucrt)
Platform: x86_64-w64-mingw32/x64 (64-bit)
Running under: Windows 10 x64 (build 19045)

Matrix products: default

locale:
[1] LC_COLLATE=Indonesian_Indonesia.utf8  LC_CTYPE=Indonesian_Indonesia.utf8   
[3] LC_MONETARY=Indonesian_Indonesia.utf8 LC_NUMERIC=C                         
[5] LC_TIME=Indonesian_Indonesia.utf8    

attached base packages:
[1] stats     graphics  grDevices utils     datasets  methods   base     

other attached packages:
 [1] here_1.0.1         xlsx_0.6.5         modelsummary_1.4.1
 [4] brglm2_0.9         lubridate_1.9.2    forcats_1.0.0     
 [7] stringr_1.5.0      dplyr_1.1.2        purrr_1.0.1       
[10] readr_2.1.4        tidyr_1.3.0        tibble_3.2.1      
[13] ggplot2_3.4.2      tidyverse_2.0.0    haven_2.5.2       

loaded via a namespace (and not attached):
 [1] tidyselect_1.2.0    xfun_0.39           rJava_1.0-6        
 [4] lattice_0.20-45     parameters_0.21.0   colorspace_2.1-0   
 [7] vctrs_0.6.2         generics_0.1.3      htmltools_0.5.5    
[10] enrichwith_0.3.1    utf8_1.2.3          rlang_1.1.1        
[13] pillar_1.9.0        glue_1.6.2          withr_2.5.0        
[16] effectsize_0.8.3    emmeans_1.8.5       lifecycle_1.0.3    
[19] munsell_0.5.0       gtable_0.3.3        bayestestR_0.13.1  
[22] mvtnorm_1.1-3       htmlwidgets_1.6.2   coda_0.19-4        
[25] knitr_1.42          tzdb_0.3.0          fastmap_1.1.1      
[28] pscl_1.5.5.1        datawizard_0.7.1    fansi_1.0.4        
[31] xlsxjars_0.6.1      xtable_1.8-4        scales_1.2.1       
[34] backports_1.4.1     DT_0.27             checkmate_2.2.0    
[37] hms_1.1.3           digest_0.6.31       stringi_1.7.12     
[40] insight_0.19.1      numDeriv_2016.8-1.1 grid_4.2.1         
[43] rprojroot_2.0.3     cli_3.6.1           tools_4.2.1        
[46] magrittr_2.0.3      pkgconfig_2.0.3     MASS_7.3-57        
[49] Matrix_1.5-4        estimability_1.4.1  timechange_0.2.0   
[52] rstudioapi_0.14     R6_2.5.1            tables_0.9.17      
[55] nnet_7.3-18         compiler_4.2.1 
```
