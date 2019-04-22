
#Using R, amalgamating all of the crime data from each csv file into one dataset.
#Saving this dataset into a csv file called AllNICrimeData. Counting  and showing the number of rows in the AllNICrimeData dataset.

Step-1

#extracting all NI  crime data into Ni crime data folder
zipperfile <- "NI Crime Data.zip"
unzip(zipperfile)

setwd("~/R/NI Crime Data")
getwd()
#Listing all ni crime data sets
csv_files <- list.files(full.names=TRUE, recursive=TRUE)
csv_files

# COMNBINING ALL DATA SETS 

AllNiCrimeData <- Reduce(rbind, lapply(csv_files, read.csv))

#Setting working directory to previous
setwd("~/R")
getwd()

# Now Displaying combined " AllNiCrime " data set
head(AllNiCrimeData)
nrow(AllNiCrimeData)


#We are saving AllNicrimedata" file to the working directory
write.csv(AllNiCrimeData,"~/R/AllNiCrimeData.csv")

#Step-2
#Descriiption - we modify and remove columns CRIME ID , TEPORTED BY, FALLS, WITHIN,LSOA CODE ISQA NAME, LAST OUTCOME AND CONTEXT FROM " AllNiCrimedata data set

head(AllNiCrimeData)


#Code:
# to view total number of columns in data set
ncol(AllNiCrimeData)

#to filter intended columns 
AllNiCrimeData <- AllNiCrimeData[-c(1,3,4,8,9,11,12)]
ncol(AllNiCrimeData)
head(AllNiCrimeData)
str(AllNiCrimeData)
#output
#by this step we removed few intended columns to create "AllNiCrimeData" Dataset"

#Factorising the crime type attributes
class(AllNiCrimeData)
AllNiCrimeData$Crime.type <- factor(AllNiCrimeData$Crime.type)
str(AllNiCrimeData)
View(AllNiCrimeData)
