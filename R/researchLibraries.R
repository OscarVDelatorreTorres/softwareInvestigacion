# Removes all the non base uploades libraries in the RAM memory====

pkgs_to_unload <- setdiff(
  grep("^package:", search(), value = TRUE),
  paste0("package:", c("base", "stats", "graphics", "grDevices", "utils", "datasets", "methods", "tools"))
)

for (a in 1:length(pkgs_to_unload)) {
  try(detach(pkgs_to_unload[a], unload = TRUE, character.only = TRUE), silent = TRUE)
}

cat("\f")
message("All the non base libraries have been unloaded from the RAM memory...")

loadedNamespaces()

# R libraries used in the data gathering process====
if (!require("dplyr")){
  install.packages("dplyr"); library(dplyr)
} else {
  library(dplyr)
}
if (!require("tidyverse")){
  install.packages("tidyverse"); library(tidyverse)
} else {
  library(tidyverse)
}    
if (!require("plotly")){
  install.packages("plotly"); library(plotly)
} else {
  library(plotly)
}
if (!require("RSQLite")){
  install.packages("RSQLite"); library(RSQLite)
} else {
  library(RSQLite)
}
if (!require("openxlsx")){
  install.packages("openxlsx"); library(openxlsx)
} else {
  library(openxlsx)
}
if (!require("MSGARCH")){
  install.packages("MSGARCH"); library(MSGARCH)
} else {
  library(MSGARCH)
}
if (!require("DT")){
  install.packages("DT"); library(DT)
} else {
  library(DT)
}
if (!require("kableExtra")){
  install.packages("kableExtra"); library(kableExtra)
} else {
  library(kableExtra)
}
if (!require("stargazer")){
  install.packages("stargazer"); library(stargazer)
} else {
  library(stargazer)
}
if (!require("reticulate")){
  install.packages("reticulate"); library(reticulate)
} else {
  library(reticulate)
}
if (!require("zoo")){
  install.packages("zoo"); library(zoo)
} else {
  library(zoo)
}
if (!require("DescTools")){
  install.packages("DescTools"); library(DescTools)
} else {
  library(DescTools)
}
if (!require("MASS")){
  install.packages("MASS"); library(MASS)
} else {
  library(MASS)
}
if (!require("sandwich")){
  install.packages("sandwich"); library(sandwich)
} else {
  library(sandwich)
}
if (!require("data.table")){
  install.packages("data.table"); library(data.table)
} else {
  library(data.table)
}
if (!require("FAOSTAT")){
  install.packages("FAOSTAT"); library(FAOSTAT)
} else {
  library(FAOSTAT)
}
if (!require("OECD")){
  install.packages("OECD"); library(OECD)
} else {
  library(OECD)
}

if (!require("siebanxicor")){
  install.packages("siebanxicor"); library(siebanxicor)
} else {
  library(siebanxicor)
}

if (!require("fredr")){
  install.packages("fredr"); library(fredr)
} else {
  library(fredr)
}
fredr_set_key("4eb53eaf47755fc5cfbdafcc35facc53")

if (!require("tseries")){
  install.packages("tseries"); library(tseries)
} else {
  library(tseries)
}

if (!require("forecast")){
  install.packages("forecast"); library(forecast)
} else {
  library(forecast)
}

if (!require("tibble")){
  install.packages("tibble"); library(tibble)
} else {
  library(tibble)
}
if (!require("lmtest")){
  install.packages("lmtest"); library(lmtest)
} else {
  library(lmtest)
}
if (!require("urca")){
  install.packages("urca"); library(urca)
} else {
  library(urca)
}
if (!require("quantmod")){
  install.packages("quantmod"); library(quantmod)
} else {
  library(quantmod)
}
if (!require("PerformanceAnalytics")){
  install.packages("PerformanceAnalytics"); library(PerformanceAnalytics)
} else {
  library(PerformanceAnalytics)
}
if (!require("gapminder")){
  install.packages("gapminder"); library(gapminder)
} else {
  library(gapminder)
}

if (!require("plm")){
  install.packages("plm"); library(plm)
} else {
  library(plm)
}

# R wraper functions ====

# This is a wraper function that works with the Mexican Statistics, Geographics and informatics Intitute (INEGI) api:
source("https://raw.githubusercontent.com/OscarVDelatorreTorres/datosINEGI/main/datosINEGI.R")

# This is a wraper function to fetch data from Yahoo Finance:
source("https://raw.githubusercontent.com/OscarVDelatorreTorres/yahooFinance/main/datosMultiplesYahooFinance.R")

