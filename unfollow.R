#Twitter search script
library(twitteR);
#Follow functions
library(httr)

#Connect config files
source("credentials.R")
source("users.R")

#Function for follow users
unfollow<-function(user_id,oauth_token){
  url<-paste("https://api.twitter.com/1.1/friendships/destroy.json?user_id=",user_id,"&follow=true",sep="",collapse="")
  print(url)
  result<-POST(url,config(token = oauth_token))
  print result
}

#Connect with browser authentification when you need it
setup_twitter_oauth(consumer_key, consumer_secret, access_token=NULL, access_secret=NULL)
options(httr_oauth_cache=T)

oauth_token<-readRDS('.httr-oauth')

#Get unfollow users
unfollow_users_raw<-unique(setdiff(getFollowingByUser(main_user),getFollowersByUser(main_user)))[1:500]
unfollow_users<-unfollow_users_raw[!is.na(unfollow_users_raw)]

#Unfollow
for (user_for_unfollow in unfollow_users) {
  unfollow(user_for_unfollow, oauth_token$`00621addcfb660406f05c240f4a13d36`)
  Sys.sleep(60);
}