# Getting and Cleaning Data Course Project

Peer-graded Assignment: Getting and Cleaning Data Course Project - 2019

## Overview

This is the repository for the coursera "Getting and Cleaning Data Course Project". The goal of this assignment is to demonstrate the student's ability to read raw data and transform it in a tidy and ready to analyze format.

## The Dataset

The dataset used for this assignment is called "Human Activity Recognition Using Smartphones Data Set" and the complete information can be found in the following [link](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). It comprises measurements from smartphones accelerometers performed during different activities (walking, standing, laying, etc.)

### The data set structure

The dataset files can be found in this [link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and its structure is described below. 

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

The assingment asks for the following tasks or steps:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

In order to execute those tasks, the undelying structure and relationships of the files had to be understood. *README.txt* and *features_info.txt* provide a good explanation of the composition of the dataset. 

* The measurement data is stored in two separate datasets, a training and a test (this is done to perform machine learning tasks) one:  
    - *X_train.txt*
    - *X_test.txt*
* The measurements column's headers are stored in a separate file called:
    - *features.txt*
* The subjects' specific id were stored in:
    - *subject_train.txt*
    - *subject_test.txt*
* The activity id is and its corresponding lookup table can be found in:
    - *y_test.txt* and *y_train.txt*
    - *activity_labels.txt*


