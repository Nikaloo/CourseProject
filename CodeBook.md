### Codebook for the Course Project

##Variables

*`subjectid` Unique Identifier for individuals participating in the project ranges from 1-30.
*`activity` descriptive variable of the activity being measured. Can have the following values: "walking", "walkingUpstairs", "walkingDownstiars", "sitting", "standing", "laying"
*`tBodyAccJerkMeanX` Mean body acceleration jerk in the x dimension
*`tBodyAccJerkMeanY` Mean body acceleration jerk in the y dimension
*`tBodyAccJerkMeanZ` Mean body acceleration jerk in the z dimension
*`tBodyAccJerkStdX` Standard deviation of body acceleration jerk in the x dimension
*`tBodyAccJerkStdY` Standard deviation of body acceleration jerk in the y dimension
*`tBodyAccJerkStdZ` Standard deviation of body acceleration jerk in the z dimension
*`tBodyAccMeanX` Mean body acceleration in the x dimension
*`tBodyAccMeanY` Mean body acceleration in the y dimension
*`tBodyAccMeanZ` Mean body acceleration in the z dimension
*`tBodyAccStdX` Standard deviation of body acceleration in the x dimension
*`tBodyAccStdY` Standard deviation of body acceleration in the x dimension
*`tBodyAccStdZ` Standard deviation of body acceleration in the x dimension

##Datasets
In the first dataset `completed2` there are 10299 observations and these 14 variables. Each observation is unique.
In the second "tidy" dataset `completedcast` there are 40 observations and 14 variables. Each observation is supposed to be a unique measure of the tBody variables based on unique combinations of `subjectid` and `activity`. However, You'll note that there ae 40 observations instead of the predicted 30. Additionally, there are duplicates and missing `subjectid`s. Therefore, this dataset should be used with caution. It was created with `melt` and `dcast` functions. the problem is currently being investigated.

##Transformations
In the `completedcast` dataset, the variables other than the identifier variables `subjectid` and `activity` are means. However, read above to understand likely errors.
