#Cleaning Data in R Excerise 2

#Step 01: Run the following codes

#Step 02: Install pacakges
install.packages('tm')
install.packages('wordcloud')

#Step 03: Load the required library
library(tm)
library(wordcloud)

#Step 04: Read in the data
df <- read.csv("C:\\Users\\BenjiLat\\Google Drive\\CleaningDataWithR\\ex3\\tweets.csv",stringsAsFactors = FALSE)

#Step 05 : Read the tweets as corpus 
#          We will only use the tweets which is the 1st column of the data frame to form the corpus 
tweet_corpus <- Corpus(VectorSource(df[,1]))

#Step 06 : Create a document matrix
tweet_dtm <- TermDocumentMatrix(tweet_corpus)

#Step 07 : Convert back to matrix and  Sort words by decreasing frequency
tweet_m<- as.matrix(tweet_dtm)
tweet_sort<- sort(rowSums(tweet_m), decreasing=TRUE)

tweets_df <- data.frame(word=names(tweet_sort), freq=tweet_sort)
wordcloud(tweets_df$word, tweets_df$freq, min.freq=3)

#Step 08 : Corpus Transformation
tweet_corpus <- tm_map(tweet_corpus, removePunctuation)
tweet_corpus <- tm_map(tweet_corpus, removeNumbers)
stopwords('english')
tweet_corpus <- tm_map(tweet_corpus, removeWords, stopwords('english'))

#Step 09 : Highlight Step 6 to 7 and run it