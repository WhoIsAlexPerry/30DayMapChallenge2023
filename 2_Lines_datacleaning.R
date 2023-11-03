#packages
library(maps)
library(ggplot2)
library(tidyverse)
library(osrm)
library(sf)
library(tidygeocoder)
library(ggmap)
library(gganimate)
library(gifski)
library(av)
library(httr)
library(jsonlite)

#read in data 
NABJ <- read_csv("data/NABJConRaw.csv")

#pull just the city 
NABJcities <- NABJ$City

#convert this to coords
data <- tidygeocoder::geo(NABJcities, method = "osm") %>% 
  st_as_sf(coords = c("long", "lat"), crs = 4326)



   


