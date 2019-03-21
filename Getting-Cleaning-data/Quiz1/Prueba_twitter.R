library(httr)
library(jsonlite)

myapp <- oauth_app("twitter", 
                   key = "mnB577SpHix2J2OsGsvhtA51Q",
                   secret = "DuClTyXve2DqTqOxCNzGdmEe1tdtnCFBrng2Z48iZ85MrLQsQE")

sig <- sign_oauth1.0(myapp,
                     token = "24077367-zoRwkkV3aLuP4ZByZUoXL9NRZQpFiCiwD4k5IFgz4",
                     token_secret = "q9b8RdanSJSrmDd96UgImn05IJaMRCXlDbb0l65qcRUcn")

homeTL = GET("https://api.twitter.com/1.1/statuses/home_timeline.json",sig)

json1 <- content(homeTL)
json2 <- fromJSON(toJSON(json1))
a <- json2[1:100,1:4]


#install.packages("twitteR")
library(twitteR)

consumer_key <- "mnB577SpHix2J2OsGsvhtA51Q"
consumer_secret <- "DuClTyXve2DqTqOxCNzGdmEe1tdtnCFBrng2Z48iZ85MrLQsQE"
access_token <- "24077367-zoRwkkV3aLuP4ZByZUoXL9NRZQpFiCiwD4k5IFgz4"
access_secret <- "q9b8RdanSJSrmDd96UgImn05IJaMRCXlDbb0l65qcRUcn"

setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)
tw = twitteR::searchTwitter('peru + salud',
                            n = 1e5, since = '2016-11-08', 
                            retryOnRateLimit = 1e3)
d = twitteR::twListToDF(tw)

library(rtweet)

create_token(
    app = "twitter",
    consumer_key = "mnB577SpHix2J2OsGsvhtA51Q",
    consumer_secret = "DuClTyXve2DqTqOxCNzGdmEe1tdtnCFBrng2Z48iZ85MrLQsQE",
    access_token = "24077367-zoRwkkV3aLuP4ZByZUoXL9NRZQpFiCiwD4k5IFgz4",
    access_secret = "q9b8RdanSJSrmDd96UgImn05IJaMRCXlDbb0l65qcRUcn")

rt <- search_tweets(
    "Salud + peru", n = 1000000, include_rts = FALSE, 
    retryonratelimit = TRUE,type = "popular"
)

rt <- search_tweets(
    "salud", geocode = lookup_coords("peru"), n = 10000
)





