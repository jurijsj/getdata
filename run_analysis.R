#Download and uzip dataset
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zip_file <- "dataset.zip"
download.file(url, destfile=zip_file)
unzip(zip_file)

#TEST Data load
x_test <- read.table(".\\UCI HAR Dataset\\test\\X_test.txt")
y_test <- read.table(".\\UCI HAR Dataset\\test\\y_test.txt")
subj_test <- read.table(".\\UCI HAR Dataset\\test\\subject_test.txt")

#Train data load
x_train <- read.table(".\\UCI HAR Dataset\\train\\X_train.txt")
y_train <- read.table(".\\UCI HAR Dataset\\train\\y_train.txt")
subj_train <- read.table(".\\UCI HAR Dataset\\train\\subject_train.txt")

#Bind train data set with training labels (activity names, range 1:6) 
b_train <- cbind(x_train, y_train)
#Bind train data set with subject labels (range 1:30)
b_train <- cbind(b_train, subj_train)

#Bind test data set with training labels (activity)
b_test <- cbind(x_test, y_test)
#Bind test data set with subject labels (range 1:30)
b_test <- cbind(b_test, subj_test)

#Merging traing and test data sets
b_data <- rbind(b_train, b_test)

#Loading features (column names)
features <- read.table(".\\UCI HAR Dataset\\features.txt")
names_v <-  as.character(features$V2)
#Adding activity and subject names to names vector 
names_v <- c(names_v, "activity", "subject")

#Loading activity labels
activity_labels <- read.table(".\\UCI HAR Dataset\\activity_labels.txt")

#Getting positions of the mean() and std() variables ONLY!! ommiting 'meanFreq()' variable
col_pos <- grep("mean[()]|std[()]|activity|subject", names_v)
#Extracting only mean and std variables from data set
c_data <- b_data[,col_pos]
#Assign descriptive names to variables
names(c_data) <- names_v[col_pos]


#Name activities to descriptive activity names; 
#1. using merge function join data set with activity labels
c_data <- merge(c_data, activity_labels, by.x="activity", by.y="V1")
c_data$activity <- c_data$V2
#2. removing duplicate variable 
c_data <- c_data[,!names(c_data) %in% "V2"]
#c_date - tidy data set; 10299 obs. of 68 variables

#Creating second, independent tidy data set with the average of each variable for each activity and each subject.
#1.defining data to aggregate
data <- c_data[, !names(c_data) %in% c("activity", "subject")]
#2.defining aggregate by columns
agg_by <- list(c_data$activity, c_data$subject)
#3. aggregating
data_agg <- aggregate(data, by=agg_by, FUN="mean")
#4.defining descriptive names to group variables
names(data_agg)[c(1,2)] <- c("activity", "subject")


# Writing tigy and second to files
write.table(c_data, file="tidy_data.txt", sep=",", row.names=FALSE)
write.table(data_agg, file="aggregated_data.txt", sep=",", row.names=FALSE)

