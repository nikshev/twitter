#Follow functions
library(httr)

#Connect config files
source("credentials.R")

#Function for follow users
follow<-function(user_id,oauth_token){
  POST("https://api.twitter.com/1.1/friendships/create.json?user_id="+user_id+"&follow=true", 
       config(token = oauth_token))
}

#Get raw data from follow data file 
twitter_users_for_follow_data_raw<-read.table(twitter_users_for_follow, colClasses = "character")

#Get unique data from follow data array
twitter_users_for_follow_data<-unique(twitter_users_for_follow_data_raw)

#Get raw data from following data file 
twitter_users_following_data_raw<-read.table(twitter_users_following, colClasses = "character")

#Get unique data from following data
twitter_users_following_data<-unique(twitter_users_following_data_raw)

#Get difference beetwen follow and following data
twitter_users_data_diff<-setdiff(twitter_users_for_follow_data$V1,twitter_users_following_data$V1)
session_users_follow<-unique(twitter_users_data_diff[1:10])

#Remove NA from array
session_users_follow <- session_users_follow[!is.na(session_users_follow)] 

setup_twitter_oauth(consumer_key, consumer_secret, access_token=NULL, access_secret=NULL)
options(httr_oauth_cache=T)

readRDS('.httr-oauth')

for (user_for_follow in session_users_follow) {
  print(user_for_follow)
}
