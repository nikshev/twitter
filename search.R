#Twitter search script
library(twitteR);
#Connect credentials file
source("credentials.R")
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)
tweets = searchTwitter("#Etsy", n=10)
tweetsDF <- twListToDF(tweets)
forExtract=unique(tweetsDF$screenName)
for (user in forExtract){
 print(user)
}