# script for course project Getting and Cleaning Data

# The files in https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
# should be available in the working diretory

# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement. 
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names. 
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Filenames and locations 
features_file <- "./UCI HAR Dataset/features.txt"
activity_labels_file <- "./UCI HAR Dataset/activity_labels.txt"


x_train_file <- "./UCI HAR Dataset/train/X_train.txt"
y_train_file <- "./UCI HAR Dataset/train/y_train.txt"
subject_train_file <- "./UCI HAR Dataset/train/subject_train.txt"

x_test_file <- "./UCI HAR Dataset/test/X_test.txt"
y_test_file <- "./UCI HAR Dataset/test/y_test.txt"
subject_test_file <- "./UCI HAR Dataset/test/subject_test.txt"

# Reading features and activities
features <- read.table(features_file)
activity <- read.table(activity_labels_file)

# Reading the train set
train <- read.table(x_train_file)
train_labels <- read.table(y_train_file)
train_subj <- read.table(subject_train_file)

# Adding variable names
names(train) = features[,2]
train$label = train_labels[,1]
train$subject = train_subj[,1]

# Reading the test set
test <- read.table(x_test_file)
test_labels <- read.table(y_test_file)
test_subj <- read.table(subject_test_file)

# Adding variable names
names(test) = features[,2]
test$label = test_labels[,1]
test$subject = test_subj[,1]

# Assigning new row names to test set
start <- dim(train)[1]+1
end <- start + dim(test)[1] - 1
rownames(test) <- c(start:end)

# Merging train and test sets
merged <- rbind(train, test)

# Remove unwanted colons. Keeping std(), mean(), label and subject

final <- merged[ , grep("mean\\(\\)|std\\(\\)|label|subject", colnames(merged))]

# Adding sensible name to activities/labels
final$label <- factor(final$label, labels = as.character(activity[,2]))

# Writing tidy set to file
write.table(final, "tidy_data_set.txt", row.names = FALSE, col.names = FALSE)
