rm(list=ls())
scf_data <- read.csv("SCFP2022.csv")

keep_columns <- c(
  "AGE", "AGECL", "HHSEX", "EDCL","RACE","LF","HSTOCKS","THRIFT", "IRAKH", 
  "KNOWL", "FINLIT","INCOME", "MARRIED"
)
scf_data_2 <- scf_data[, keep_columns, drop = FALSE]

library(fastDummies)
scf_data_2 <- dummy_cols(
  scf_data_2, select_columns = "AGECL", remove_selected_columns = TRUE
)
scf_data_2$AGE_18_34 <- scf_data_2$AGECL_1
scf_data_2$AGE_35_44 <- scf_data_2$AGECL_2
scf_data_2$AGE_45_54 <-scf_data_2$AGECL_3
scf_data_2$AGE_55_64 <- scf_data_2$AGECL_4
scf_data_2$AGE_64_75 <- scf_data_2$AGECL_5
scf_data_2$AGE_75_plus <- scf_data_2$AGECL_6
scf_data_2$AGECL_1 <- NULL
scf_data_2$AGECL_2 <- NULL
scf_data_2$AGECL_3 <- NULL
scf_data_2$AGECL_4 <- NULL
scf_data_2$AGECL_5 <- NULL
scf_data_2$AGECL_6 <- NULL

names(scf_data_2)[names(scf_data_2) == "HHSEX"] <- "MALE"
scf_data_2$MALE <- ifelse(scf_data_2$MALE == 2, 0, 1)
names(scf_data_2)[names(scf_data_2) == "LF"] <- "IN_LABOR_FORCE"
scf_data_2$MARRIED <- ifelse(scf_data_2$MARRIED == 1, 1, 0)

scf_data_2$KNOWL_FINLIT <- NULL
scf_data_2$KNOWL_FINLIT <- scf_data_2$KNOWL * scf_data_2$FINLIT

library(dplyr)
scf_data_2 <- scf_data_2 %>% mutate(
  RACE_white_non_hispanic = ifelse(RACE == 1, 1, 0),
  RACE_black_african_american = ifelse(RACE == 2, 1, 0),
  RACE_hispanic = ifelse(RACE == 3, 1, 0),
  RACE_other = ifelse(RACE %in% c(4, 5), 1, 0)
)
scf_data_2$RACE <- NULL

scf_data_2$LTHRIFT <- log(scf_data_2$THRIFT)
scf_data_2$LIRAKH <- log(scf_data_2$IRAKH)
scf_data_2$LINCOME <- log(scf_data_2$INCOME)
scf_data_2$THRIFT <- NULL
scf_data_2$IRAKH <- NULL
scf_data_2$INCOME <- NULL
# NAs created 

scf_data_2$LIRAKH <- ifelse(is.infinite(scf_data_2$LIRAKH), log(0.01), scf_data_2$LIRAKH)
scf_data_2$LTHRIFT <- ifelse(is.infinite(scf_data_2$LTHRIFT), log(0.01), scf_data_2$LTHRIFT)
scf_data_2$LINCOME <- ifelse(is.infinite(scf_data_2$LINCOME), log(0.01), scf_data_2$INCOME)
inf_rows <- which(is.infinite(scf_data_2$LINCOME))
scf_data_2[inf_rows, ]
scf_data_2<- scf_data_2[!is.infinite(scf_data_2$LINCOME), ]
sum(is.infinite(scf_data_2$LINCOME))

mean_knowledge <- mean(scf_data_2$KNOWL, na.rm = TRUE)
mean_finlit <- mean(scf_data_2$FINLIT, na.rm = TRUE)
scf_data_2$KNOWLL <- ifelse(scf_data_2$KNOWL > mean_knowledge, 1, 0)
scf_data_2$FINLITT <- ifelse(scf_data_2$FINLIT > mean_finlit, 1, 0)
scf_data_2$KNOWL_FINLIT <- scf_data_2$KNOWLL * scf_data_2$FINLITT
scf_data_2$KNOWL <- NULL
scf_data_2$FINLIT <- NULL
scf_data_2 <- scf_data_2 %>% rename(KNOWL = KNOWLL)
scf_data_2 <- scf_data_2 %>% rename(FINLIT = FINLITT)

scf_data_2 <- dummy_cols(
  scf_data_2, select_columns = "EDCL", remove_selected_columns = TRUE
)

scf_data_2 <- scf_data_2 %>% rename(EDCL_no_HS = EDCL_1)
scf_data_2 <- scf_data_2 %>% rename(EDCL_HS_GED = EDCL_2)
scf_data_2 <- scf_data_2 %>% rename(EDCL_some_college = EDCL_3)
scf_data_2 <- scf_data_2 %>% rename(EDCL_college_degree = EDCL_4)

write.csv(scf_data_2, file = "scf_data_clean.csv", row.names = FALSE)
