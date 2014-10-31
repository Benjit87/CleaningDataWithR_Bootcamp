#Please refer to http://theminingbook.blogspot.com/2014/03/r-oauth-for-twitter.html
#For a good tutorial on how to authenticate with Twitter

#Step 03

#Download installer
install.packages('twitteR')
install.packages('ROAuth')
install.packages('(RCurl')
#Load libraries
library(twitteR)
library(ROAuth)
library(RCurl)
download.file(url="http://curl.haxx.se/ca/cacert.pem",destfile="cacert.pem")
#You will need to generate your own key and secrete
consumerKey = "*****"
consumerSecret = "*****"
accessURL <- "https://api.twitter.com/oauth/access_token"
authURL <- "https://api.twitter.com/oauth/authorize"
requestURL <- "https://api.twitter.com/oauth/request_token"
twitCred <- OAuthFactory$new(consumerKey=consumerKey,
                             consumerSecret=consumerSecret,
                             requestURL=requestURL,
                             accessURL=accessURL,
                             authURL=authURL)
twitCred$handshake(cainfo="cacert.pem")


#Once done you can save for future use
save(list="twitCred", file="twitteR_credentials")


#Now we can use it, lets search about recent events!
library (twitteR)
load("twitteR_credentials")
registerTwitterOAuth(twitCred)


#Step 04: Search about recent events
s <- searchTwitter('#ISIS',cainfo="cacert.pem", n = 100)

#Step 05: Create the data frame
df <- do.call("rbind", lapply(s, as.data.frame))

#Write out to CSV
write.csv(df,"C:\\Users\\benjit\\Google Drive\\CleaningDataWithR\\ex4\\tweets.csv",row.names=FALSE)



