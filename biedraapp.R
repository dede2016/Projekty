library(shiny)
library(leaflet)
library(rvest)
library(ggmap)
library(dplyr)
r_colors <- rgb(t(col2rgb(colors()) / 255))
names(r_colors) <- colors()

ui <- fluidPage(
  leafletOutput("mymap")
)

server <- function(input, output, session) {

  url <- paste("http://www.biedronka.pl/pl/sklepy/lista,lat,52.25,lng,21,page,12.html", sep="")
  
  oferty <- read_html(url)    
  sklepy <- oferty %>%
    html_nodes("h4") %>%
    html_text()
  sklepy
  sklepyul <-sklepy
  
}

sklepy

to_remove<-paste(c("\n","Wszystko co potrzebne na œwiêta", "\r","\t","ul."), collapse="|")
to_removeul<-paste(c("\n","Wszystko co potrzebne na œwiêta", "\r","\t","ul."), collapse="|")
sklepy<-gsub(to_remove, "", sklepy)
sklepy
sklepy<-gsub(to_removeul, "", sklepyul)

geocodes<-geocode(sklepy, output="latlona")

leaflet(geocodes) %>% addTiles() %>%
  addMarkers(~lon, ~lat, popup = ~as.character(sklepyul))

  }



shinyApp(ui, server)
