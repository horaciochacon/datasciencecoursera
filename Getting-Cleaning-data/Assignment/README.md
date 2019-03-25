# Getting and Cleaning Data Course Project

Peer-graded Assignment: Getting and Cleaning Data Course Project - 2019

## Overview

This is the repository for the coursera "Getting and Cleaning Data Course Project". The goal of this assignment is to demonstrate the student's ability to read raw data and transform it in a tidy and ready to analyze format.

## The Dataset

The data set used for this assignment is called "Human Activity Recognition Using Smartphones Data Set" and the complete information can be found in the following [link](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). It comprises measurements from smartphones accelerometers performed during different activities (walking, standing, laying, etc.)

### The data set structure

The data set files can be found in this [link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and its structure is described below. 

```s
└── UCI HAR Dataset
   ├── activity_labels.txt*
   ├── features.txt*
   ├── features_info.txt
   ├── README.txt
   ├── test
   │  ├── Inertial Signals
   │  │  ├── body_acc_x_test.txt
   │  │  ├── body_acc_y_test.txt
   │  │  ├── body_acc_z_test.txt
   │  │  ├── body_gyro_x_test.txt
   │  │  ├── body_gyro_y_test.txt
   │  │  ├── body_gyro_z_test.txt
   │  │  ├── total_acc_x_test.txt
   │  │  ├── total_acc_y_test.txt
   │  │  └── total_acc_z_test.txt
   │  ├── subject_test.txt*
   │  ├── X_test.txt*
   │  └── y_test.txt*
   └── train
      ├── Inertial Signals
      │  ├── body_acc_x_train.txt
      │  ├── body_acc_y_train.txt
      │  ├── body_acc_z_train.txt
      │  ├── body_gyro_x_train.txt
      │  ├── body_gyro_y_train.txt
      │  ├── body_gyro_z_train.txt
      │  ├── total_acc_x_train.txt
      │  ├── total_acc_y_train.txt
      │  └── total_acc_z_train.txt
      ├── subject_train.txt*
      ├── X_train.txt*
      └── y_train.txt*
```
Marked with an "*" are the files that are needed for the assignment.

## The analysis

The assignment asks for the following tasks or steps:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

In order to execute those tasks, the underlying structure and relationships of the files had to be understood. *README.txt* and *features_info.txt* provide a good explanation of the composition of the data set. 

* The measurement data is stored in two separate data sets, a training and a test (this is done to perform machine learning tasks) one:  
    - *X_train.txt*
    - *X_test.txt*
* The measurements column's headers are stored in a separate file called:
    - *features.txt*
* The subjects' specific id were stored in:
    - *subject_train.txt*
    - *subject_test.txt*
* The activity id is and its corresponding look-up table can be found in:
    - *y_test.txt* and *y_train.txt*
    - *activity_labels.txt*
    
## The tasks executed in the run_analysis.R script

1. Step 1: Here all the necessary *\*.txt* files are loaded, id columns are added for every train and test data set. Then the two separate data sets are appended row-wise.
2. Step 2: All variables names coming from *features.txt* rename the previously unnamed (V1:V561) columns with dplyr rename_at function. Right after, I select specific column names that contain the *mean()* or *std()* string using **regular expresions** and grep.
3. Step 3: By the means of a look-up table (*activity_labels.txt*) the activity ids coming from *y_test.txt* and *y_train.txt* are replaced. Intermediary variables and data frames are removed.
4. Step 4: Variable names are formatted in an appropriate way (no non alphanumeric characters). I opted to leave the uppercase letters as they help differentiate columns with several words.
5. Step 5: With a dplyr pipe workflow using gather to convert all measurements in two key-value variables and a group by-summarize statement the tidy data set is obtained ()

## Output

1. Procesed data frame: wearableMeasurements
2. Tidy data frame:     wearableTidy






