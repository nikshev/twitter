#Extract user functions

#Function extract user and it followers
#return array of users ID
getUserAndFollowersIDs<-function(user){
  tUser<-getUser(user)
  tUserID<-tUser$id
  tUserFollowerIDs<-tUser$getFollowerIDs()
  return(c(tUserID,tUserFollowerIDs)); 
}