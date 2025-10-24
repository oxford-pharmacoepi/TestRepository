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

