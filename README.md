# Course project for Getting and Cleaning Data

Repository contains the course projet for coursea course Getting and Cleaning Data.

The dataset from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip is arranged according to the projet assignment.

### Files 
*run_analysis.R* contains the script for creating the tidy data set

*tidy_data_set.txt* the cleaned and tidy data set

*CoodBook.md* the codebook for the new dataset


### About run_analysis.R
The script expects to find the catalog from the original data set in its working directory.


The script reads the test and the train set and uses the features file for column names.


Activities and subjects are added to both respetive data frames before they are merged and only std() and mean() varaibles are kept.


Activity labels are added to the set before it is writen to fil.