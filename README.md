CourseProject
=============

Getting and Cleaning Data Course Project Repo

### Introduction

This is a repository for the project to "collect, work with, and clean" the 
Human Activity Recognition Using Smartphones Data Set from the Machine Learning
Repository here:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The data was provided here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

##Assignment Outline

" 1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject."

## (1) Completed Data Set
My complete data set has 10299 observations and 14 variables. The first variable (column)
is the `subjectid` which provides a unique id for every individual in the dataset. 
The second variable is the `activity` being preformed. The next 12 are variables representing
means and standard deviations from measurements using the accelerometers from the 
Samsung Galaxy S smartphone. See (2) for the choice of variables.

## (2) Choice of Variables
I picked the following 6 mean and 6 corresponding standard deviation values from the
x datasets. I did this for simplicity and due to a lack of direction on which to pick.
The columns I picked were seperated by other columns so that I could make sure I was
able to retrieve nonadjacent columns.
"tBodyAcc-mean()-X
tBodyAcc-mean()-Y
tBodyAcc-mean()-Z
tBodyAcc-std()-X     
tBodyAcc-std()-Y
tBodyAcc-std()-Z
tBodyAccJerk-mean()-X
tBodyAccJerk-mean()-Y
tBodyAccJerk-mean()-Z
tBodyAccJerk-std()-X
tBodyAccJerk-std()-Y
tBodyAccJerk-std()-Z"

These names were altered to: 
           "tBodyAccMeanX", "tBodyAccMeanY", "tBodyAccMeanZ",
           "tBodyAccStdX", "tBodyAccStdY", "tBodyAccStdZ",
           "tBodyAccJerkMeanX", "tBodyAccJerkMeanY", "tBodyAccJerkMeanZ",
           "tBodyAccJerkStdX",  "tBodyAccJerkStdY",  "tBodyAccJerkStdZ"
           
## (3) Descriptive Activity Names
The activities were all renamed using appropriate lower case names corresponding
to the numeric code in the `activity_labels.txt` file. These were (in order):
"walking", "walkingUpstairs", "walkingDownstiars", "sitting", "standing", "laying."

## (4) Appropriate Labels
All variables are self-describing and all activities are self-describing.

## (5) Tidy data set with 1 mean for each subjectid and activity
This dataset is names `completedcast`

Thanks for reading and providing feedback!