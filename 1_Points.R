#packages
library(maps)
library(ggplot2)

#data 
newsofficesglobal <- read_csv("data/globalnewslocationscleaned.csv")
#making world map
world_map <- map_data("world")

#Base map
basemap <- ggplot() + coord_fixed() +
  xlab("") + ylab("") + geom_polygon(data=world_map, aes(x=long, y=lat, group = group), 
                                       colour="black", fill="black") +
  theme_minimal() + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = 'white',
                                  colour = 'white'), 
        axis.text.x=element_blank(),
                          axis.text.y=element_blank())

#Add simple data points and title to map
locations_map <- 
  basemap +
  geom_point(data=newsofficesglobal, 
             aes(x=longitude, y=latitude), color = 
          "Red" ,  pch=20, size=2.8, alpha=(0.7)) +
  labs(title = "The Associated Press' Foreign Bureaus", 
       subtitle = "30 Day Map Challenge | Day One | Points", 
       caption = "Source: https://www.ap.org/bureaus ",
plot.subtitle = element_text(hjust = 0)) +
  theme(plot.caption = element_text(hjust = 0, vjust = 14,
                                    size = 10)) 

#Credits
#https://sarahleejane.github.io/learning/r/2014/09/21/plotting-data-points-on-maps-with-r.html