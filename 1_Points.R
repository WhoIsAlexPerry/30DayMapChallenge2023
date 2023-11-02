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

#Add simple data points and title to map
locations_map <- 
  basemap +
  geom_point(data=reutersofficesglobal, 
             aes(x=longitude, y=latitude), colour="Orange", 
             pch=16, size=1.5, alpha=I(0.7)) +
  labs(title = "Reuters' Global Office Locations", subtitle = "30 Day Map Challenge | Day One | Points", 
       caption = "Source:https://www.thomsonreuters.com/en/locations.html",
plot.subtitle = element_text(hjust = 0), plot.caption = element_text(hjust = -10))

#Credits
#https://sarahleejane.github.io/learning/r/2014/09/21/plotting-data-points-on-maps-with-r.html