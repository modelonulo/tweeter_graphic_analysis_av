library(tm)
library(lubridate)
library(dplyr)
library(plotly)
library(scales)
library(formattable)
library(RSentiment)
library(stringr)
library(broom)
library(tidyr)
library(tidytext)
library(igraph)
library(ggplot2)

tweets <- read.csv('tweets.csv',header = T,stringsAsFactors = F)


names(tweets)


temp <- tweets %>% select(handle,is_retweet)
temp$is_retweet <- ifelse(temp$is_retweet=='False','Original Tweets','Retweets')
temp<- temp %>% group_by(is_retweet,handle) %>% summarise(n=n())
ggplot(temp, aes(x=handle, y=n, fill=is_retweet)) + geom_bar(position="dodge",stat='identity')
