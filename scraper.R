library(rvest)
oferty <- read_html("http://www.irishjobs.ie/ShowResults.aspx?Keywords=&Location=0&Category=3&Recruiter=Company&Recruiter=Agency")
cast1 <- oferty %>%
  html_nodes(".salary") %>%
  html_text()
cast1

cast2 <- oferty %>%
  html_nodes("h2") %>%
  html_text()
cast2 <- cast2[-(1)]
cast2

df = data.frame(cast1,cast2) 
df


