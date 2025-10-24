#1 Make sure you have the latest version of the needed packages:
#install.packages("pak")
#pak::pkg_install(c("omopgenerics", "CodelistGenerator", "CDMConnector", "ohdsi/omock"))

#2 Set up your OMOP_DATA_FOLDER:
#usethis::edit_r_environ()
#3 Check that the environment variable is correctly set up:
Sys.getenv("OMOP_DATA_FOLDER")

#4 Create a cdm reference:
library(omock)
library(duckdb)
cdm <- mockCdmFromDataset(datasetName = "empty_cdm", source = "duckdb")
cdm

#5 CodelistGenerator
library(CodelistGenerator)
library(tibble)
library(here)
library(omopgenerics)

##5.1 
#codelist
codes <- list(codelist_name = c(252942L, 257581L, 313236L)) |>
  newCodelist()
codes
#codelist of codelists
codes <- list(codelist_1 = c(252942L, 257581L, 313236L), codelist_2 = c(46269775L, 46269784L)) |>
  newCodelist()

#Export codelist
exportCodelist(x = codes, path = here(), type = "csv")
exportCodelist(x = codes, path = here(), type = "json")

##5.2 Issue #44 Obesity

candidates <- getCandidateCodes(cdm = cdm, keywords = "obesity")
codes <- list(obesity = candidates$concept_id) |>
  newCodelist()
codes

codelist_folder = here::here("codelists")
exportCodelist(x = codes, path = codelist_folder, type = "csv")
