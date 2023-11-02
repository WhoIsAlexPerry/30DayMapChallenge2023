#packages
library(maps)
library(ggplot2)

#data 
reutersofficesglobal <- read.csv("data/Alloffices.csv")
#making world map
world_map <- map_data("world")

#Base map
basemap <- ggplot() + coord_fixed() +
  xlab("") + ylab("") + geom_polygon(data=world_map, aes(x=long, y=lat, group=group), 
                                       colour="black", fill="black") +
  theme_minimal() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), 
                          panel.background = element_rect(fill = 'white', colour = 'white'), 
                          axis.line = element_line(colour = "white"),
                          axis.ticks=element_blank(), axis.text.x=element_blank(),
                          axis.text.y=element_blank())

#Add simple data points to map
locations_map <- 
  basemap +
  geom_point(data=reutersofficesglobal, 
             aes(x=longitude, y=latitude), colour="Red", 
             fill="Pink",pch=15, size=2, alpha=I(0.7))