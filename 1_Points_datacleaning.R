#reading in packages
library(tidyverse)
library(readxl)
library(stringr)
library(dplyr)

#reading in data
globalnewslocations <- read_csv("data/AP.csv")

globalnewslocations$WKT <- str_remove(globalnewslocations$WKT, 
                                      pattern = "POINT ")

globalnewslocations[c('longitude', 'latitude')] <- str_split_fixed(globalnewslocations$WKT, ' ', 2)

globalnewslocations$latitude <- gsub("\\(|\\)", "", globalnewslocations$latitude)

globalnewslocations$longitude <- gsub("\\(|\\)", "", globalnewslocations$longitude)


write.csv(globalnewslocations,file='data/globalnewslocationscleaned.csv', row.names=FALSE)
