library(rvest)
library(ggmap)
library(leaflet)
library(dplyr)




for (a in 2:6){
  url <- paste("http://www.biedronka.pl/pl/sklepy/lista,lat,52.25,lng,21,page,,"a",.html", sep="")
  
  oferty <- read_html(url)    
  sklepy <- oferty %>%
    html_nodes("h4") %>%
    html_text()
  sklepy
  for (i in 1:length(sklepy)) {
    sklepy<-[i+(20*(a-2)),1]
  }
  
}

sklepy

to_remove<-paste(c("\n","Wszystko co potrzebne na œwiêta", "\r","\t",","), collapse="|")

sklepy<-gsub(to_remove, "", sklepy)
sklepy

geocodes<-geocode(sklepy, output="latlona")

leaflet(geocodes) %>% addTiles() %>%
  addMarkers(~lon, ~lat, popup = ~as.character(sklepy))


