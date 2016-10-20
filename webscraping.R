# Webscraping script
# Get data from twitter statistic file (tweets with best ratio)
# Get text/header 

# load packages
library(bitops)
library(RCurl)
library(XML)

#Choose and read file
myFile<-file.choose()
tweets<-read.csv(myFile,header=FALSE)

#for (tweets_row in tweets){
  tweets_row<-tweets$V1[2]
  # download html
  html <- getURL(tweets_row, followlocation = TRUE)
  
  # parse html
  doc = htmlParse(html, asText=TRUE)
  #plain.text <- xpathSApply(doc, "//text()[not(ancestor::script)][not(ancestor::style)][not(ancestor::noscript)][not(ancestor::form)]", xmlValue)
  #cat(paste(plain.text, collapse = "\n"))
  header <- xpathApply(doc, "//h1//text()[not(ancestor::script)][not(ancestor::style)][not(ancestor::noscript)][not(ancestor::form)]", xmlValue)
  txt <- xpathApply(doc, "//p//text()[not(ancestor::script)][not(ancestor::style)][not(ancestor::noscript)][not(ancestor::form)]", xmlValue)
  cat(unlist(txt))
#}