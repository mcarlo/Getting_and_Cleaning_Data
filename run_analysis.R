##################################################
## Step 0 - Downloading and extracting the data ##
##################################################

setwd("~/")
# If loop: Check for "data" directory.  Create one if needed.
if (!file.exists("data")) {
        dir.create("data")
}

# Download data
if (!file.exists("./data/dataset.zip")) {
        download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "./data/dataset.zip")
}

# Extract .zip files into "data" directory
unzip("./data/dataset.zip", exdir = "./data")

########################################################################
## Step 1 - Merge the Test and Training sets to create one data set   ##
########################################################################

# read features and convert from a row vector to a column vector
Features <- read.table("./data/UCI HAR Dataset/features.txt")
Features <- t(Features)

# Create a "clean" training set
Subject <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
colnames(Subject) <- "Subject"
TrainData <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
colnames(TrainData) <- Features[2,]
TrainLabels <- read.table("./data/UCI HAR Dataset/train/Y_train.txt")
colnames(TrainLabels) <- "ActivityLabel"

Train <- cbind(Subject, TrainLabels, TrainData)

# Create a "clean" test set
Subject <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
colnames(Subject) <- "Subject"
TestData <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
colnames(TestData) <- Features[2,]
TestLabels <- read.table("./data/UCI HAR Dataset/test/Y_test.txt")
colnames(TestLabels) <- "ActivityLabel"

Test <- cbind(Subject, TestLabels, TestData)

# Merge test and training sets into a single object called myData
myData <- rbind(Test, Train)

#########################################################################
## Step 2 - Extract means and standard deviations for each measurement ##
#########################################################################

myMean <- grep("mean()", names(myData), fixed = TRUE)
myStd <- grep("std()", names(myData), fixed = TRUE)
myMeanStd <- c(myMean, myStd)
sort(myMeanStd)
myNewData <- myData[, myMeanStd]
myExtract <- cbind(myData[ ,1:2], myNewData)

#############################################
## Step 3 - Use descriptive activity names ##
#############################################

# read Activity Labels into a data frame and convert factors to characters
ActivityLabels <- data.frame(lapply(read.table("./data/UCI HAR Dataset/activity_labels.txt"), as.character), stringsAsFactors=FALSE)
colnames(ActivityLabels) <- c("ActivityLabel", "ActivityName")

# Install plyr packagge
install.packages("plyr")
library(plyr)

# Use join from plyr package to apply descriptive activity names
myActivity <- join(myData, ActivityLabels, type = "inner", by = "ActivityLabel")
myData[,2] <- myActivity[,564]
myExtract[,2] <- myActivity[,564]

####################################################################################
## Step 5 - Create a data set that averages each variable by subject and activity ##
####################################################################################

# install reshape2 package to allow melting functionality
install.packages("reshape2")
library(reshape2)

myMelt <- melt(myExtract, id = c("Subject", "ActivityLabel"))
myCast <- dcast(myMelt, Subject + ActivityLabel ~ variable,mean)

# Remove unneeded objects to free memory
rm(Subject, TrainData, TrainLabels, TestData, TestLabels, Test, Train, myNewData, Features, myMeanStd, myMean, myStd, ActivityLabels, myActivity, myMelt)

#########################################################################
write.csv(myExtract, file = "./UCI HAR Dataset Extract.txt", row.names = FALSE)
write.csv(myCast, file = "./UCI HAR Dataset Mean by Subject and Activity.txt", row.names = FALSE)
