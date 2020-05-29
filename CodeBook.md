# CodeBook


The `run_analysis.R` script merges the data collected from the accelerometers and the gyroscopes from the Samsung Galaxy S smartphone. Further it creates tidy datasets as described below:

1. **Downloading the datasets**
    + Checking if the datasets file exists and downloading the data in the `UCI_HAR_Dataset` file. <p>&nbsp;</p>

1. **Loading the datasets**
    + `features`<- `features.txt` : contains 561 rows and 2 columns
        + Read as table with columns: `n` and `functions`
        + The functions in this are obtained from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
    + `activity_labels`<- `activity_labels.txt` : contains 6 rows and 2 columns
        + Read as table with columns: `code` and `activity`
        + This links the activities through their code to the subjects
    + `subjects_train`<- `subject_train.txt` : contains 7352 rows in a single column
        + Read as table with column: `subject`
        + It contains the 21 training subjects under observation out of the 30 volunteered.
    + `train_set`<- `X_train.txt` : contains 7352 rows and 561 columns
        + Read as table with columns from `functions` in `features`
        + This contains the training set of values
    + `train_set_activity`<- `y_train.txt` : contains 7352 rows in a single column
        + Read as table with columns as`code`
        + This gives the labels for activities of `train_set`
    + `subjects_test`<- `subject_test.txt` : contains 2947 rows in a single column
        + Read as table with column: `subject`
        + It contains the 9 test subjects under observation
    + `test_set`<- `X_test.txt` : contains 2947 rows and 561 columns
        + Read as table with columns from `functions` in `features`
        + This contains the test set of values
    + `test_set_activity`<- `y_test.txt` : contains 2947 rows in a single column
        + Read as table with columns as`code`
        + This gives the labels for activities of `test_set`. <p>&nbsp;</p>

1. **Merging the Datasets into a single Dataset**
    + `subjects_train_test` : contains 10299 rows in a single column
        + formed by merging `subjects_train` and `subjects_test` using **rbind()** function
    + `train_test_set` : contains 10299 rows and 561 columns
        + formed by merging `train_set` and `test_set` using **rbind()** function
    + `train_test_set_activity` : contains 10299 rows in a single column
        + formed by merging `train_set_activity` and `test_set_activity` using **rbind()** function 
    + `Data` : contains 10299 rows and 563 columns
        + formed by merging `subjects_train_test` , `train_test_set_activity` and `train_test_set` using **cbind()** function. <p>&nbsp;</p>

1. **Extracting values of mean and standard deviation**
    + `mean_std_measurements` : contains 10299 rows and 88 columns
        + Formed by subsetting the columns: `subject` , `code` and the measurements on the **mean** and **standard deviation** for each measurement with the **select()** function 
        + the subsetting of the measurements on the **mean** and **standard deviation** for each measurement is done on the column names that contain "**mean**" and "**std**" string respectively using the **contains()** special function as arguments to the **select()** function. <p>&nbsp;</p>
        
1. **Giving Descriptive activity names**
    + The entire **code** column is replaced with the labels in `activity_labels`.  <p>&nbsp;</p>
        
1. **Giving Descriptive variable names**
    + **subject** column becomes **Subject**
    + **code** column becomes **Activity**
    + All names starting with character "**t**" is replaced by "**Time**"
    + All "**Freq**" in column's name replaced by "**Frequency**"
    + All names starting with character "**f**" is replaced by "**Frequency**"
    + All "**BodyBody**" in column's name replaced by "**Body**"
    + All "**Acc**" in column's name replaced by "**Accelerometer**"
    + All "**Gyro**" in column's name replaced by "**Gyroscope**"
    + All "**mean**" in column's name replaced by "**Mean**"
    + All "**Mag**" in column's name replaced by "**Magnitude**"
    + All "**angle**" in column's name replaced by "**Angle**"
    + All "**tBody**" in column's name replaced by "**TimeBody**"
    + All "**gravity**" in column's name replaced by "**Gravity**"
    + All "**std**" in column's name replaced by "**STD**". <p>&nbsp;</p>
        
1. **Taking mean of variables for each activity of each subject**
    + `variables_mean`: contains 180 rows and 88 columns
        + The `mean_std_measurements` is grouped on two levels using the **group_by()** function: 
            1. according to **Subject**
            1. according to **Activity**
        + This is summarised by **summarise_all()** function only to take **mean** of the measurements using the special function **funs()**. <p>&nbsp;</p> 
        
1. **Forming a final tidy dataset**
    + The final tidy dataset is file `TidyData.txt` as a text file

            
            

