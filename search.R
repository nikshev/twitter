#Twitter search script
library(twitteR);
#Connect credentials file
source("credentials.R")
twitCred <- OAuthFactory$new(consumerKey=consumerKey,
                             consumerSecret=consumerSecret,
                             requestURL=reqURL,
                             accessURL=accessURL,
                             authURL=authURL)
download.file(url="http://curl.haxx.se/ca/cacert.pem", destfile="cacert.pem")

twitCred$handshake(cainfo="cacert.pem")

registerTwitterOAuth(twitCred)