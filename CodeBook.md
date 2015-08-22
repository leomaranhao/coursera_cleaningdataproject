# Code Book - Coursera_cleaningdataproject
Code book of the project related to the Coursera course "Getting and Cleaning Data"

## Acknowledgements

The dataset used in this project was part of the following publication: 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

## Objectives

The objective of this project was to transform the original dataset, from the publication above, into a tidy dataset following certain rules: 
1. The training and the test datasets should be merged into one dataset.
2. Only the average of measurements on the mean and standard deviation of each variable for each activity and each subject should be present. 
3. Descriptive activity names should be used to name the activities in the data set.
4. Data should be appropriately labeled with descriptive variable names. 

## The Original Dataset 

For the details of the original dataset refer to the publication [1] and the original dataset in the following link:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Features of The Transformed Dataset

The final dataset was built from the original dataset, merging the trainning and test datasets and selecting only the features related to the mean and standard deviation. After the merging of the datasets, the data was averaged by activity and by subject, resulting in a table where each row has the average of each column of the merged dataset by activity and by subject.

The features selected were the following:

"tBodyAcc-mean()-X" 
"tBodyAcc-mean()-Y" 
"tBodyAcc-mean()-Z" 
"tBodyAcc-std()-X" 
"tBodyAcc-std()-Y" 
"tBodyAcc-std()-Z" 
"tGravityAcc-mean()-X" 
"tGravityAcc-mean()-Y" 
"tGravityAcc-mean()-Z" 
"tGravityAcc-std()-X" 
"tGravityAcc-std()-Y" 
"tGravityAcc-std()-Z" 
"tBodyAccJerk-mean()-X" 
"tBodyAccJerk-mean()-Y" 
"tBodyAccJerk-mean()-Z" 
"tBodyAccJerk-std()-X" 
"tBodyAccJerk-std()-Y" 
"tBodyAccJerk-std()-Z" 
"tBodyGyro-mean()-X" 
"tBodyGyro-mean()-Y" 
"tBodyGyro-mean()-Z" 
"tBodyGyro-std()-X" 
"tBodyGyro-std()-Y" 
"tBodyGyro-std()-Z" 
"tBodyGyroJerk-mean()-X" 
"tBodyGyroJerk-mean()-Y" 
"tBodyGyroJerk-mean()-Z" 
"tBodyGyroJerk-std()-X" 
"tBodyGyroJerk-std()-Y" 
"tBodyGyroJerk-std()-Z" 
"tBodyAccMag-mean()" 
"tBodyAccMag-std()" 
"tGravityAccMag-mean()" 
"tGravityAccMag-std()" 
"tBodyAccJerkMag-mean()" 
"tBodyAccJerkMag-std()" 
"tBodyGyroMag-mean()" 
"tBodyGyroMag-std()" 
"tBodyGyroJerkMag-mean()" 
"tBodyGyroJerkMag-std()" 
"fBodyAcc-mean()-X" 
"fBodyAcc-mean()-Y" 
"fBodyAcc-mean()-Z" 
"fBodyAcc-std()-X" 
"fBodyAcc-std()-Y" 
"fBodyAcc-std()-Z" 
"fBodyAccJerk-mean()-X" 
"fBodyAccJerk-mean()-Y" 
"fBodyAccJerk-mean()-Z" 
"fBodyAccJerk-std()-X" 
"fBodyAccJerk-std()-Y" 
"fBodyAccJerk-std()-Z" 
"fBodyGyro-mean()-X" 
"fBodyGyro-mean()-Y" 
"fBodyGyro-mean()-Z" 
"fBodyGyro-std()-X" 
"fBodyGyro-std()-Y" 
"fBodyGyro-std()-Z" 
"fBodyAccMag-mean()" 
"fBodyAccMag-std()" 
"fBodyBodyAccJerkMag-mean()" 
"fBodyBodyAccJerkMag-std()" 
"fBodyBodyGyroMag-mean()" 
"fBodyBodyGyroMag-std()" 
"fBodyBodyGyroJerkMag-mean()" 
"fBodyBodyGyroJerkMag-std()" 

Each of these 66 features became a column in the final dataset. To those 66 columns, 2 extra columns were added. One for the activity label and another for the subject ("Activity" and "Subject").

## Files of The Final Dataset

The final dataset includes the following files:

README.md - explain the workings of the run_analysis.R script, used to transform the original dataset into the final dataset.
CodeBook.md - this files.
run_analysis.R - the R script that built the final datasets.
finalOutput.txt - the final dataset.