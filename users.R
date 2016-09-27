#Extract user functions

#Function extract user and it followers
#return array of users ID
getUserAndFollowersIDs<-function(user){
  tUser<-getUser(user)
  tUserID<-tUser$id
  tUserFollowerIDs<-tUser$getFollowerIDs()
  return(c(tUserID,tUserFollowerIDs)); 
}

#Function extract following by user name
#return array of users ID
getFollowingByUser<-function(user){
  #Connect to twitter
  setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)
  #Get user info
  tUser<-getUser(user)
  return (tUser$getFriendIDs())
}

#Function extract followers by user name
#return array of users ID
getFollowersByUser<-function(user){
  #Connect to twitter
  setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)
  #Get user info
  tUser<-getUser(user)
  return (tUser$getFollowerIDs())
}