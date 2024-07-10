# Description ------------------------------------------------------------------
# R script to process uploaded raw data into a tidy, analysis-ready data frame
# Load packages ----------------------------------------------------------------
## Run the following code in console if you don't have the packages
## install.packages(c("usethis", "fs", "here", "readr", "readxl", "openxlsx"))
library(usethis)
library(fs)
library(here)
library(readr)
library(readxl)
library(openxlsx)
library(dplyr)

# Read data --------------------------------------------------------------------
data_in <- readxl::read_excel("data-raw/Survey_base.xlsx")
# Tidy data --------------------------------------------------------------------
## Modify variable types
data_in <- data_in[,-c(1,4,6)]

saniabidjan <- data_in |>
  dplyr::mutate(dplyr::across(tidyselect::everything(), ~ dplyr::na_if(., "NA"))) |>
  dplyr::mutate(dplyr::across(c(area_name, sex, education, housing_type, status, location,
                         latrine_type, using_latrines, latrine_cleaning,
                         tank_location, household_wastewater, common_diseases,
                         impacts_of_sharing, tank_operation, emptying_frqce_yr, emptying_mode,
                         garbage_loc)
                       ,as.factor)) |>
  dplyr::rename(lat_facilities = latrine_presence,
                facilities_type = latrine_type,
                lat_use = using_latrines,
                nb_user = users,
                facilities_loc = location,
                lat_care = latrine_cleaning,
                clean_freq_wk = cleaning_freqce_wk,
                tk_status = tank_operation,
                empty_freq_yr = emptying_frqce_yr,
                empty_mode = emptying_mode,
                empty_price = emptying_price,
                wastwat_dispos = household_wastewater,
                waste_cont = garbage_cont,
                waste_cont_loc = garbage_loc,
                cont_empty_wk = garbage_emptying_wk,
                common_ill = common_diseases) |>
  dplyr::mutate(nb_user = dplyr::case_when(
    nb_user == "1_3"~"2",
    nb_user == "4_6"~"5",
    nb_user == "7_10"~"8.5",
    nb_user == ">10"~ "10")) |>
  dplyr::mutate(clean_freq_wk = dplyr::case_when(
    clean_freq_wk == "1_3" ~ "2",
    clean_freq_wk == ">4"~"4")) |>
  dplyr::mutate(latrines_nb = dplyr::case_when(
    latrines_nb == "1_5"~"3",
    latrines_nb == "6_10"~"8",
    latrines_nb == ">10"~"10")) |>
  dplyr::mutate(empty_price = dplyr::case_when(
    empty_price == "10000_20000"~"15000",
    empty_price == "20000_40000"~"30000",
    empty_price == ">40000"~"40000")) |>
  dplyr::mutate(cont_empty_wk = dplyr::case_when(
    cont_empty_wk == "1_3"~"2",
    cont_empty_wk == "4_7"~"5.5")) |>
  dplyr::mutate(across(c(nb_user, clean_freq_wk, latrines_nb, empty_price, cont_empty_wk), as.numeric)) |>
  # Yes/No to logical variables
  dplyr::mutate(across(c(lat_facilities, tank_presence, waste_cont),
                       ~ dplyr::case_when(
                         . == "yes" ~ TRUE,
                         . ==  "no" ~ FALSE
  ))) |>
  dplyr::mutate(lat_use = dplyr::case_when(lat_use == "sharing" ~ TRUE, lat_use == "not sharing" ~ FALSE)) |>
  dplyr::rename(lat_sharing = lat_use) |>
  dplyr::mutate(tk_status = dplyr::case_when(tk_status == "performs well" ~ TRUE, tk_status == "not working well" ~ FALSE)) |>


# Export Data ------------------------------------------------------------------
usethis::use_data(saniabidjan, overwrite = TRUE)
fs::dir_create(here::here("inst", "extdata"))
readr::write_csv(saniabidjan,
                 here::here("inst", "extdata", paste0("saniabidjan", ".csv")))
openxlsx::write.xlsx(saniabidjan,
                     here::here("inst", "extdata", paste0("saniabidjan", ".xlsx")))
