install.packages(c("dplyr","dbplyr","duckdb"))
install.packages("pak")
install.packages("omopgenerics")
pak::pkg_install(c("omopgenerics", "CodelistGenerator", "CDMConnector", "ohdsi/omock"))
usethis::edit_r_environ()

Sys.getenv("OMOP_DATA_FOLDER")
library(omock)
library(duckdb)
cdm <- mockCdmFromDataset(datasetName = "empty_cdm", source = "duckdb")
cdm
library(CodelistGenerator)
library(tibble)
library(here)
library(omopgenerics)

codes <- list(codelist_name = c(252942L, 257581L, 313236L)) |>
  newCodelist()
codes
codes <- list(codelist_1 = c(252942L, 257581L, 313236L), codelist_2 = c(46269775L, 46269784L)) |>
  newCodelist()
codes
codes <- getDrugIngredientCodes(cdm = cdm, name = "acetaminophen", routeCategory = "oral", nameStyle = "{concept_name}")
codes

