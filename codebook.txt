##VARIABLES

Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation

- tidy_data.txt	contain tidy data set with all variables mentioned earlier (mean, std)
- aggregated_data.txt data set with the average of each variable for each activity and each subject


##DATA TRANSFORMATION STEPS

1. Download and uzip dataset "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
2. Load train and test data sets into separate data frames x_train and x_test acoordingly
3. Load training labels (y_test, y_train) that describes activity types
4. Load subject data sets (train, test) that describes who performed the activity for each window sample
5. Bind train data set with training labels (x_train and y_train) into new data frame b_train
6. Bind test data set with training labels (x_test and y_test) into new data frame b_test
7. Merge train and test data sets together; using rbing function, merge b_train and b_test data sets
8. Load features list that describes data set variable names; load into 'features' vector
9. Add 'activity' and 'subject' names into 'features' vector
10. Get positions of the mean() and std() variables ONLY!! ommiting 'meanFreq()' variable
11. Extract only mean and std variables from data set; extracted data set - 'c_data'
12. Load activity labes into 'activity_labels' frame;
13. Name 'activity' variable in 'c_data' to descriptive activity names; Using merge function, merge 'c_data' with activity labels
14. Assign c_data$activity (contains 1:6 range) values to c_data$V2 values (contains descriptive values)
15. Remove duplicate variable 'V2' from 'c_data' which left from merging;
16. Create second, independent tidy data set with the average of each variable for each activity and each subject. 
17. Write tidy data and aggregate data sets into files