scf_data <- read.csv("scf_data_clean.csv")

thrift_reg <- lm(
  LTHRIFT ~
    MALE + HSTOCKS + MARRIED + EDCL_HS_GED + EDCL_some_college + EDCL_college_degree +
    IN_LABOR_FORCE +LINCOME + RACE_black_african_american + RACE_hispanic + 
    RACE_other + KNOWL + FINLIT + KNOWL_FINLIT + AGE_35_44 + AGE_45_54 + AGE_55_64 +
    AGE_64_75 + AGE_75_plus, data = scf_data
)
summary(thrift_reg)

irakh_reg <- lm(
  LIRAKH ~
    MALE + HSTOCKS + MARRIED + EDCL_HS_GED + EDCL_some_college + EDCL_college_degree +
    IN_LABOR_FORCE +LINCOME + RACE_black_african_american + RACE_hispanic + 
    RACE_other + KNOWL + FINLIT + KNOWL_FINLIT + AGE_35_44 + AGE_45_54 + AGE_55_64 +
    AGE_64_75 + AGE_75_plus, data = scf_data
)
summary(irakh_reg)

library(stargazer)
stargazer(thrift_reg,irakh_reg, type = "html", out = "regression_results.html")
