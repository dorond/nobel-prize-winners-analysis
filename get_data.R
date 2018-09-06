library(httr)
library(jsonlite)
library(tidyverse)
library(listviewer)

prizes <- read_csv("http://api.nobelprize.org/v1/prize.csv")
write.csv(prizes, "prizes.csv")
countries <- read_csv("http://api.nobelprize.org/v1/country.csv")
write.csv(countries, "countries.csv")

url <- "http://api.nobelprize.org/v1/laureate.json"
laureates <- fromJSON(url)
laureates <- as_tibble(laureates$laureates)
laureates <- laureates %>% select(-prizes)

laureates_prizes <- fromJSON(url)
laureates_prizes <- as_tibble(laureates_prizes$laureates$prizes)
laureates_prizes <- laureates_prizes %>% select(prizes)

#write.csv(laureates, "laureates.csv")
