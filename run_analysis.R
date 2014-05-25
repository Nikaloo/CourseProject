#Getting and Cleaning Data Course Project

#Purpose: collect, work with and clean a dataset


##Download and unzip the file
if(!file.exists("GetDataProject")) {
      dir.create("GetDataProject")
}

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./GetDataProject/HAR.zip")
list.files("./GetDataProject")
dateDownloaded <- date()
dateDownloaded
unzip("./GetDataProject/HAR.zip",exdir="GetDataProject")
list.files("./GetDataProject")

#Reading the features data in. Comments not present and all ColClasses are character.
features <- read.table("./GetDataProject/UCI HAR Dataset/features.txt",
                       comment.char = "", colClasses = "character")
#creating a list of features to name xtest and xtrain columns
featureslist <- features[,2]
subset <- c(1:6,81:86)
featureslist[subset] #displaying the chosen means and standard deviations

#Reading the test data in. Comments not present and all ColClasses are numeric

SubjectTest <- read.table("./GetDataProject/UCI HAR Dataset/test/subject_test.txt",
                    comment.char = "", colClasses = "factor")
xTest <- read.table("./GetDataProject/UCI HAR Dataset/test/X_test.txt", 
                    comment.char = "", colClasses = "numeric")
yTest <- read.table("./GetDataProject/UCI HAR Dataset/test/Y_test.txt", 
                    comment.char = "", colClasses = "factor")

#Reading the train data in. Comments not present and all ColClasses are numeric

SubjectTrain <- read.table("./GetDataProject/UCI HAR Dataset/train/subject_train.txt", 
                     comment.char = "", colClasses = "factor")
xTrain <- read.table("./GetDataProject/UCI HAR Dataset/train/X_train.txt", 
                     comment.char = "", colClasses = "numeric")
yTrain <- read.table("./GetDataProject/UCI HAR Dataset/train/Y_train.txt", 
                     comment.char = "", colClasses = "factor")

#This step names the columns in Subject___ and y____ for __=test or train 
#and relabels y____ observations descriptively.
names(SubjectTrain) <- "subjectid"
names(SubjectTest) <- "subjectid"
names(yTrain) <- "activitynumber"
names(yTest) <- "activitynumber"

#Keeping columins in xTest and xTrain based on features subset above.
xTrainSubset <- xTrain[,subset]
xTestSubset <- xTest[,subset]

#naming the columns in the subsetted 'x' data.
xcolumns <- c("tBodyAccMeanX", "tBodyAccMeanY", "tBodyAccMeanZ",
           "tBodyAccStdX", "tBodyAccStdY", "tBodyAccStdZ",
           "tBodyAccJerkMeanX", "tBodyAccJerkMeanY", "tBodyAccJerkMeanZ",
           "tBodyAccJerkStdX",  "tBodyAccJerkStdY",  "tBodyAccJerkStdZ")
names(xTrainSubset) <- xcolumns
names(xTestSubset) <- xcolumns

#Activity Labels to connect with yTest and yTrain labels.
activityLabels <- read.table("./GetDataProject/UCI HAR Dataset/activity_labels.txt", 
                      comment.char = "", colClasses = "character")

#Better Activity Labels (lower case except first letter of 
#second word, not "_" or ".")
columns <- c("id", "label")
names(activityLabels) <- columns
activity <- c("walking", "walkingUpstairs", "walkingDownstiars", "sitting", 
               "standing", "laying")
activityLabels <- cbind(activityLabels,activity)
activityLabels <- activityLabels[,c("id","activity")]
yTrainLabel <- merge(x=yTrain,y=activityLabels,by.x=1,by.y="id")
yTestLabel <- merge(x=yTest,y=activityLabels,by.x=1,by.y="id")

#Combining Train data into one dataframe and test data into another.
#cbind is used because there is no unique identifier. Row 1 in one file
# corresponds to row 1 in another file.
train <- cbind(SubjectTrain,yTrainLabel,xTrainSubset)
test <- cbind(SubjectTest,yTestLabel,xTestSubset)

#complete is a combination of the 7352 train and 2947 test observations
#complete will have 10,299 observations and 564 variables.
complete <- rbind(train,test)

#Dropping activity number as redundant with activity
keep <- c(1,3:15)
completed <- complete[,keep]
completed2 <- arrange(completed,subjectid)
#completed column 1 is the subject identifier and 2 is the activity.

#Now it's time to separate identifier versus measure variables for melting
completedColumns <- names(completed2)
idvariables <- completedColumns[c(1,2)]
measurevariables <- completedColumns[c(3:14)]

#Time to melt into a long skinny dataset with all measures in a single column
completedmelt <- melt(completed2,id=idvariables,measure.vars=measurevariables)

#Casting the data
completedcast <- dcast(completedmelt, subjectid + activity ~ measurevariables, mean)