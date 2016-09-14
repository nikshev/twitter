#Script for working with tweets

#Function get tweets 
#Search tweets by wordForSearch with limit of tweets count (tweetsLimit)
#Return tweets converted to data frame
#Before calling function must be connect to twitter
getTweets<-function(wordForSearch,tweetsLimit=10){
  tweets = searchTwitter(wordForSearch, tweetsLimit);
  return (twListToDF(tweets));
}

#Function get tweets users 
#Search tweets by wordForSearch with limit of tweets count (tweetsLimit) 
#Return unique users array
#Before calling function must be connect to twitter
getTweetsUsers<-function(wordForSearch,tweetsLimit){
  tweetsDF<-getTweets(wordForSearch,tweetsLimit)
  return (unique(tweetsDF$screenName));
}