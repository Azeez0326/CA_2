#importing data from csv
nipc <- read.csv("NIPostcodes.csv")

#showing the total number of rows
nrow(nipc)
#structure of the dataframe
str(nipc)
#displaying first 10 rows of a datframe containg all the Nipostcode data
head(nipc, n=10)

names(nipc)[1] <- "organisation name"
names(nipc)[2] <- "sub-building name"
names(nipc)[3] <- "building name"
names(nipc)[4] <- "number"
names(nipc)[5] <- "primary thorfare"
names(nipc)[6] <- "alt thorfare"
names(nipc)[7] <- "secondary thorfare" 
names(nipc)[8] <- "locality"
names(nipc)[9] <- "townland"
names(nipc)[10] <- "town"
names(nipc)[11] <- "county"
names(nipc)[12] <- "postcode"
names(nipc)[13] <- "x-coordinate"
names(nipc)[14] <- "y-coordinate"
names(nipc)[15] <- "primary key (identifier)"
#removing or replacing missing entries with suitable identifiers
new_nipc <- na.omit(nipc)
new_nipc


#its seems that it is better to replace the code
nipc[nipc == ""] <- NA
View(nipc)

#we are showing total number and mean missing values for each column in the postcode data frame

na_sum <- data.frame(sapply(nipc, function(y) sum(length(which(is.na(y))))))

#displaying the output of the sum
na_sum

na_mean <- data.frame(sapply(nipc, function(y) mean(is.na(y))))
na_mean

#Modifying the County attribute to be a categorising factor and showing structure of the data
nipc$county <- as.factor(nipc$county)
str(nipc)

#Moving the primary key identifier to the start of the dataset
#For moving th`e dataset we need to use the dplyr and the packages should be installed
install.packages("dplyr")
library(dplyr)
nipc <- nipc %>% select(`primary key (identifier)`, everything())
head(nipc, 10)
view(nipc)


#We store the fields that are having in the town as LIMAVADY and saving the file "LIMAVADY.csv"
Limavady_data <- data.frame(nipc$Locality, nipc$Townland, nipc$Town) %>% filter(nipc$Town == "LIMAVADY")
Limavady_data
write.csv(Limavady_data, "Limavady.csv")
#structure of limavady data
str(Limavady_data)

#Saving the modified NIPostcode dataset in a csv file called CleanNIPostcodeData.
write.csv(nipc, "CleanNIPostcodeData.csv")
