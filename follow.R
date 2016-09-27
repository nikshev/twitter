#Twitter search script
library(twitteR);
#Follow functions
library(httr)

#Connect config files
source("credentials.R")
source("users.R")

#Function for follow users
follow<-function(user_id,oauth_token){
  url<-paste("https://api.twitter.com/1.1/friendships/create.json?user_id=",user_id,"&follow=true",sep="",collapse="")
  print(url)
  POST(url,config(token = oauth_token))
}

#Get raw data from follow data file 
twitter_users_for_follow_data_raw<-read.table(twitter_users_for_follow, colClasses = "character")

#Get unique data from follow data array
twitter_users_for_follow_data<-unique(twitter_users_for_follow_data_raw)

#Get difference beetwen follow and following data
twitter_users_data_diff<-setdiff(twitter_users_for_follow_data$V1,getFollowingByUser(main_user))
session_users_follow<-unique(twitter_users_data_diff[1:500])

#Remove NA from array
session_users_follow <- session_users_follow[!is.na(session_users_follow)] 

#Connect with browser authentification when you need it
setup_twitter_oauth(consumer_key, consumer_secret, access_token=NULL, access_secret=NULL)
options(httr_oauth_cache=T)

oauth_token<-readRDS('.httr-oauth');

for (user_for_follow in session_users_follow) {
  follow(user_for_follow,oauth_token$`00621addcfb660406f05c240f4a13d36`)
  write(user_for_follow,file=twitter_users_following,append=TRUE)
}
