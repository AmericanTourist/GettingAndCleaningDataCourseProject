## This R Script downloads the accelerometer and gyroscope data for 30 subjects
## who are doing 6 different activities. We group data sets together and find the 
## mean value for each of the subjects based on which activity they are doing.

## Download and unzip the file in the current directory
filename<-"raw_data.zip"

library(stringr)
library(reshape2)


# Check if the file has already been downloaded, if not, then download it
if (!file.exists(filename)){
  fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileUrl,filename)
}

# Check if the file has been unzipped. If not, then unzip it.
if (!file.exists("UCI HAR Dataset")){
  unzip(filename)
}

## Load the activity labels into a variable called activities.
## 1. WALKING
## 2. WALKING_UPSTAIRS
## 3. WALKING_DOWNSTAIRS
## 4. SITTING
## 5. STANDING
## 6. LAYING
activities<-read.table("UCI HAR Dataset/activity_Labels.txt")

# Change the class of the 2nd column from data.frame to character
activities[,2]<-as.character(activities[,2])

# Load in the features into a variable called features.
# Example of one of the features is tBodyAcc-mean()-X, which is the mean of the 
# tBody Acceleration in the x-direction
# So these are really not features, but different measurements, or calculations.
features<-read.table("UCI HAR Dataset/features.txt")

# Change the class of the 2nd column from data.frame to character
features[,2]<-as.character(features[,2])

# Grab everything from this 477-level list that mentions the mean or std
# feature_columns will be the columns that have the mean or std in them
# features_project will be the values of the strings for these columns, which we 
# will adjust shortly to make it look tidier
feature_columns<-grep(".*mean.*|.*std.*",features[,2])
features_project<-features[feature_columns,2]

# Clean up the titles of the these observations/features
features_project<-gsub("-mean"," Mean ",features_project)
features_project<-gsub("-std"," Std Dev ",features_project)
features_project<-gsub("[-()]","",features_project)
features_project<-gsub("Freq","Freq ",features_project)
str_trim(features_project)

## There are 2 datasets to load in: test and train. Test has 30% of the data,
## and train has 70% of the data. We will only load in the columns of the datasets
## where it mentioned 'mean' or 'std', as per before.

## TRAIN

# Load in the train dataset. This will be 7352 rows and 79 columns
train<-read.table("UCI HAR Dataset/train/X_train.txt")[feature_columns]

# Load in the activities (1 - 6). This is 7352 rows and 1 column
train_activities<-read.table("UCI HAR Dataset/train/Y_train.txt")

# Load in the subject ID # (1 - 30). This is 7352 rows and 1 column.
train_subjects <- read.table("UCI HAR Dataset/train/subject_train.txt")

# Now make one train table with all of this information. 7352x81
train<-cbind(train_subjects, train_activities, train)

## TEST

# Load in the test dataset. This will be 2947 rows and 79 columns
test<-read.table("UCI HAR Dataset/test/X_test.txt")[feature_columns]

# Load in the activities (1 - 6). This is 2947 rows and 1 column
test_activities<-read.table("UCI HAR Dataset/test/Y_test.txt")

# Load in the subject ID # (1 - 30). This is 2947 rows and 1 column.
test_subjects <- read.table("UCI HAR Dataset/test/subject_test.txt")

# Now make one test table with all of this information. 2947x81
test<-cbind(test_subjects, test_activities,test)

## Now we have data tables with the same number of columns (81) so we are going
## to merge them to get one large dataset.

complete_data<-rbind(train,test)

# Let's name all the columns with the nice test names we dervied earlier that are
# stored in features_project variable.
colnames(complete_data)<-c("Subject","Activity",features_project)

# Now instead of the activities being named 1 -5, we want it to be sitting, 
# standing, etc.
complete_data$Activity<-factor(complete_data$Activity, levels = activities[,1],
                               labels = activities[,2])

# In addition, if we are going to melt the data together, which means that we
# are going to combine test data, we need to change the Subject values from 
# type "numeric" to "factors".
complete_data$Subject<-as.factor(complete_data$Subject)

# Now melt the data together. Let's keep the id identifiers as the subject(person)
# and the activity they did. In order to be id's they need to be factors, which they
# are. This tidy object will soon be written to the output text file.
tidy<-melt(complete_data,id = c("Subject","Activity"))

# As per the project instructions, create a second object that has the average
# of each variable for each activity in each subject.Our tidy_mean data frame now 
# has 180 rows and 81 columns.
tidy_mean<-dcast(tidy,Subject + Activity ~ variable, mean)

# As per the project instructions, we would now like to write this tidy_mean
# object to a text file called tidy.txt
write.table(tidy_mean,file = "tidy.txt", row.names = FALSE, quote = FALSE)