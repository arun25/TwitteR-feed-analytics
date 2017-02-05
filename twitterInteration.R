# https://www.credera.com/blog/business-intelligence/twitter-analytics-using-r-part-1-extract-tweets/

install.packages("twitteR")
install.packages("ROAuth")
library("twitteR")
library("ROAuth")

# Download "cacert.pem" file
download.file(url="http://curl.haxx.se/ca/cacert.pem",destfile="cacert.pem")

#create an object "cred" that will save the authenticated object that we can use for later sessions
##
# cred <- OAuthFactory$new(consumerKey='',
#                          consumerSecret='',
#                          requestURL='https://api.twitter.com/oauth/request_token',
#                          accessURL='https://api.twitter.com/oauth/access_token',
#                          authURL='https://api.twitter.com/oauth/authorize')

# Executing the next step generates an output --> To enable the connection, please direct your web browser to: <hyperlink> . Note:  You only need to do this part once
#cred$handshake(cainfo="cacert.pem")

#save for later use for Windows
#save(cred, file="twitter authentication.Rdata")

#load("twitter authentication.Rdata")
#registerTwitterOAuth(cred)

#if error occurred try this:
CUSTOMER_KEY <- ''
CUSTOMER_SECRET <- ''
ACCESS_TOKEN <- '-'
ACCESS_secret <- ''
setup_twitter_oauth(CUSTOMER_KEY, CUSTOMER_SECRET, ACCESS_TOKEN, ACCESS_secret)


search.string <- "Choice"
no.of.tweets <- 100

tweets <- searchTwitter(search.string, n=no.of.tweets, lang="en")
tweets


install.packages("plyr")
library(plyr)
tweets.df = ldply(tweets, function(t) t$toDataFrame())