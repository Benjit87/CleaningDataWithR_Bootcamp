#Cleaning Data in R Excerise 2


#Step 02: You can use console command to install your external package
install.packages('XLConnect')
install.packages('zoo')

#Step 03: Load the library
#External R package to read data from excel to R
library(XLConnect)
#External R packages to convert time to Year Quarter
library(zoo)

#Step 04: Read the xls and assign it to wb
wb = loadWorkbook("C:\\Users\\BenjiLat\\Google Drive\\CleaningDataWithR\\ex2\\MedianResalePrices.xls")

#Step 05: Loop the each spread sheet and append the data to a new vector
# Initialize empty vector for AngMoKio
AngMoKio = vector()

# The update frequency of the workbook is quarter per sheet so we need to loop it from 2Q2007 - 2Q2014
# We need to loop 29 times
for ( i in 1:29 )
{
  data = readWorksheet(wb, sheet = i, header = TRUE)
  
  #We only want prices for 5-Room Flats and in Ang Mo Kio every quarter
  AngMoKio = append(AngMoKio,data[1,6])
}

# Step 06:
# Lets create a Time Series for the Median Resale Price of Ang Mo Kio
# Start from 2007Q2
# Frequency will be 4 since 4 quarters a year
AMK_TS = ts(data=AngMoKio,start = c(2007,2), frequency = 4)


# Step 07:
# Convert to data frame to write out to csv
# We want 2 columns the 5 rooms median price of AMK and the Year Quater
# Convert to data frame
AMK_DF = data.frame(YearQuarter=as.yearqtr(time(AMK_TS),format = "%Y-%m-%d"),AMK5RM=AMK_TS)

# Step 08
# Write out to CSV
write.csv(AMK_DF,"C:\\Users\\benjit\\Google Drive\\CleaningDataWithR\\ex2\\amkresalehousingdata.csv",row.names=FALSE)


