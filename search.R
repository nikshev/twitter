#Twitter search script
library(twitteR);

#Connect config files
source("credentials.R")
source("words.R")

#Connect functions
source("tweets.R")
source("users.R")
source("follow.R")

#Connect to twitter
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)

#Looking user by words and follow
for (word in words){
  forExtract=getTweetsUsers(word,10);
   for (user in forExtract){
     IDs<-getUserAndFollowersIDs(user)
     for(ID in IDs) {
       write(ID,file=twitter_users_for_follow,append=TRUE)
     }
  }
}