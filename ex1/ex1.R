#Cleaning Data in R Excerise 1

#Step 03: Read in the csv file and assign to the variable df
df <- read.csv("C:\\Users\\BenjiLat\\Google Drive\\CleaningDataWithR\\ex1\\amkresalehousingdata.csv",stringsAsFactors = FALSE)

#Step 04: Check what df is
class(df)
df
head(df)

#Step 05: View Summary of df
summary(df)

#Step 06: Display structure of df
str(df)

#Step 07: Using gsub
?gsub
df$AMK5RM <- gsub("\\$","",df$AMK5RM)
df$AMK5RM <- gsub(" ","",df$AMK5RM)
df$AMK5RM <- gsub(",","",df$AMK5RM)
df$AMK5RM <- gsub("\\*","0",df$AMK5RM)

#Step 08: converting to numeric
df$AMK5RM <- gsub(",","",df$AMK5RM)

#Step 09: Summary
summary(df)
df$AMK5RM <- as.numeric(df$AMK5RM)

#Step 10: Get a lineplot
plot(df$AMK5RM/1000, main="Median Resale Price of AMK 5 Room Flats", 
     ,xlab="YearQuarter",ylab="$ in thousands",type="lines",xaxt='n')

