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
twitter_users_for_follow_data_raw<-scan(twitter_users_for_follow,what=" ")

#Get unique data from follow data array
twitter_users_for_follow_data<-unique(twitter_users_for_follow_data_raw);

#Get raw data from following data file 
twitter_users_following_data_raw<-scan(twitter_users_for_follow,what=" ")

#Get unique data from following data
twitter_users_following_data<-unique(twitter_users_following_data_raw);

#Get difference beetwen follow and following data
twitter_users_data_diff<-setdiff(twitter_users_for_follow_data,twitter_users_following_data)
session_users_follow<-unique(twitter_users_data_diff[1:10])

print(session_users_follow)