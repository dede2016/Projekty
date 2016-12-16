library(rvest)
library(ggplot2)
oferty <- read_html("http://www.irishjobs.ie/ShowResults.aspx?Keywords=&Location=0&Category=3&Recruiter=Company&Recruiter=Agency")
cast1 <- oferty %>%
  html_nodes("h2") %>%
  html_text()
fcast1 <- factor(cast1[-(1)])
fcast1




cast2 <- sample(70000:100000, 25, replace=F)
fcast2 = factor(cast2)
fcast2

df = data.frame(fcast1,fcast2)
names(df) <- c("Stanowisko", "Zarobki")

ggplot(data=df, aes(x=fcast2, y=fcast1 )) +
  geom_bar(colour="grey", stat="identity",
           position=position_dodge(),
           size=.3)  +      
  xlab("Zarobki") + ylab("Stanowisko")