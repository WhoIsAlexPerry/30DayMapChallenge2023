#packages
library(maps)
library(ggplot2)
library(tidyverse)

#data 
NABJ <- read_csv("data/NABJConRaw.csv")
#making world map
usa_map <- map_data("state")

#testing

#Base map
basemap <- ggplot() + coord_fixed() +
  xlab("") + ylab("") + geom_polygon(data=usa_map, aes(x=long, y=lat, group = group), 
                                     colour="black", fill = "white") +
  theme_minimal() + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = 'white',
                                        colour = 'white'), 
        axis.text.x=element_blank(),
        axis.text.y=element_blank())

#plot my points YUM 
locations_map <- 
  basemap +
  geom_point(data=NABJ, 
             aes(x=longitude, y=latitude), color = 
               "Red", size=2.8, alpha=(0.7))





