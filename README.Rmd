---
title: "README"
output: html_document
---


This `README` file gives a brief view of what the files contain:<p>&nbsp;</p> 


#### Getting and Cleaning Data Course Project 
The Human Activity Recognition Using Smartphones Data Set is acquired from the [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/index.php).<p>&nbsp;</p>
    
#### Dataset
[Human Activity Recognition Data Set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)<p>&nbsp;</p>

#### Files
1. `run_analysis.R` 
    + It is a script file which contains all the code required to  form a tidy Dataset as is required in the problem statement as:
        1. Merges the training and the test sets to create one data set.
        1. Extracts only the measurements on the mean and standard deviation for each measurement.
        1. Uses descriptive activity names to name the activities in the data set.
        1. Appropriately labels the data set with descriptive variable names.
        1. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


1. `Codebook`
    + Contains details about the variables used in `run_analysis.R` script.
    + Details about the summary of choices made to tidy the data and meet the expectations of the problem statement.
    
1. `TidyData.txt`
    + This is the final data acquired from the script and required from the problem statement.