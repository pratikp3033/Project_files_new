
library(dplyr)


#       Downloading data
filename <- "Coursera_DS3_Final.zip"

if (!file.exists(filename))
{
    fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileURL, filename, method="curl")
}  

if (!file.exists("UCI_HAR_Dataset")) 
{ 
    unzip(filename) 
}



#       Reading data into objects
features<- read.table("UCI_HAR_Dataset/features.txt", col.names = c("n", "functions"))
activity_labels<- read.table("UCI_HAR_Dataset/activity_labels.txt", col.names = c("code", "activity"))

subjects_train<- read.table("UCI_HAR_Dataset/train/subject_train.txt", col.names = "subject")
train_set<- read.table("UCI_HAR_Dataset/train/X_train.txt", col.names = features$functions)
train_set_activity<- read.table("UCI_HAR_Dataset/train/y_train.txt", col.names = "code")

subjects_test<- read.table("UCI_HAR_Dataset/test/subject_test.txt", col.names = "subject")
test_set<- read.table("UCI_HAR_Dataset/test/X_test.txt", col.names = features$functions)
test_set_activity<- read.table("UCI_HAR_Dataset/test/y_test.txt", col.names = "code")




# 1 ->  Merging data sets from train and test
subjects_train_test<- rbind(subjects_train, subjects_test)
train_test_set<- rbind(train_set, test_set)
train_test_set_activity<- rbind(train_set_activity, test_set_activity)

Data<- cbind(subjects_train_test, train_test_set_activity, train_test_set)



# 2 ->  Extracts only the measurements on the mean and standard deviation for each measurement.
mean_std_measurements<- Data %>% select(subject, code, contains("mean"), contains("std"))



# 3 ->  Descriptive activity names
mean_std_measurements$code<- activity_labels[mean_std_measurements$code, 2]



#4 ->   Descriptive variable names
names(mean_std_measurements)
names(mean_std_measurements)[1]<- "Subject"
names(mean_std_measurements)[2]<- "Activity"
names(mean_std_measurements) <- gsub("^t", "Time", names(mean_std_measurements))
names(mean_std_measurements) <- gsub("Freq", "Frequency", names(mean_std_measurements))
names(mean_std_measurements) <- gsub("^f", "Frequency", names(mean_std_measurements))
names(mean_std_measurements) <- gsub("BodyBody", "Body", names(mean_std_measurements))
names(mean_std_measurements) <- gsub("Acc", "Acceleration", names(mean_std_measurements))
names(mean_std_measurements) <- gsub("Gyro", "Gyroscope", names(mean_std_measurements))
names(mean_std_measurements) <- gsub("mean", "Mean", names(mean_std_measurements))
names(mean_std_measurements) <- gsub("Mag", "Magnitude", names(mean_std_measurements))
names(mean_std_measurements) <- gsub("angle", "Angle", names(mean_std_measurements))
names(mean_std_measurements) <- gsub("tBody", "TimeBody", names(mean_std_measurements))
names(mean_std_measurements) <- gsub("gravity", "Gravity", names(mean_std_measurements))
names(mean_std_measurements) <- gsub("std", "STD", names(mean_std_measurements))
names(mean_std_measurements)



# 5 ->  mean of variables for each activity of each subject
variables_mean<- mean_std_measurements %>%
    group_by(Subject, Activity) %>%
    summarise_all(funs(mean))



str(variables_mean)

write.table(variables_mean, "TidyData.txt", row.names = FALSE)

