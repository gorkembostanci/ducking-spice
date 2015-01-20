In this document, I indicate the variabes used along with their units of measures.
The original dataset contains two files named features and features_info. The readers
might refer to that dataset below for details. 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The original dataset has been created by an experiment conducted using smartphones.The 
experiments have been carried out with a group of 30 volunteers within an age bracket 
of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, 
WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II)
on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear 
acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have 
been video-recorded to label the data manually.

'subject' refers to the individual being studied.

'activityname' refers to the name of the activity that the other measurements are made upon.

The rest of the variables are the means of the variables with the corresponding name in the original
dataset, averaged over subjects and activities.

Therefore each column indicates one variable and each row indicates one observation (the mean 
corresponding to multiple obesrvations). The remaining variables are formed as below. For detailed
descriptions, the reader might refer to the original dataset.

The measurements and units are as given. 

| Variable          | measure       | unit      |
|-------------------|---------------|-----------|
| tBodyAcc-XYZ      | accelerometer | time      |
| tGravityAcc-XYZ   | accelerometer | time      |
| tBodyAccJerk-XYZ  | accelerometer | time      |
| tBodyAccMag       | accelerometer | time      |
| tGravityAccMag    | accelerometer | time      |
| tBodyAccJerkMag   | accelerometer | frequency |
| fBodyAcc-XYZ      | accelerometer | frequency |
| fBodyAccJerk-XYZ  | accelerometer | frequency |
| fBodyAccMag       | accelerometer | frequency |
| fBodyAccJerkMag   | accelerometer | frequency |
| tBodyGyro-XYZ     | gyroscope     | time      |
| tBodyGyroJerk-XYZ | gyroscope     | time      |
| tBodyGyroMag      | gyroscope     | time      |
| tBodyGyroJerkMag  | gyroscope     | time      |
| fBodyGyro-XYZ     | gyroscope     | frequency |
| fBodyGyroMag      | gyroscope     | frequency |
| fBodyGyroJerkMag  | gyroscope     | frequency |


The base variable names and their descriptions are as given. XYZ variables take one of the X,Y or 
Z values which indicate the direction. std() stands for standard deviation and mean() refers to the
mean of the underlying variable.


 
| Variable Name     | Description                                    |
|-------------------|---------------------------------------------|
| tBodyAcc-XYZ      | Time Body Acceleration -XYZ                 |
| tGravityAcc-XYZ   | Time Gravity Acceleration -XYZ              |
| tBodyAccJerk-XYZ  | Time Body Acceleration Jerk  XYZ            |
| tBodyAccMag       | Time Body Acceleration Magnitude            |
| tGravityAccMag    | Time Gravity Acceleration Magnitude         |
| tBodyAccJerkMag   | Time Body Acceleration Jerk Magnitude       |
| fBodyAcc-XYZ      | Frequency Body Acceleration -XYZ            |
| fBodyAccJerk-XYZ  | Frequency Body Acceleration Jerk    XYZ     |
| fBodyAccMag       | Frequency Body Acceleration Magnitude       |
| fBodyAccJerkMag   | Frequency Body Acceleration Jerk Magnitude  |
| tBodyGyro-XYZ     | Time Body Gyroscope -XYZ                    |
| tBodyGyroJerk-XYZ | Time Body Gyroscope Jerk  XYZ               |
| tBodyGyroMag      | Time Body Gyroscope Magnitude               |
| tBodyGyroJerkMag  | Time Body Gyroscope Jerk Magnitude          |
| fBodyGyro-XYZ     | Frequency Body Gyroscope -XYZ               |
| fBodyGyroMag      | Frequency Body Gyroscope Magnitude          |
| fBodyGyroJerkMag  | Frequency Body Gyroscope Jerk Magnitude     |
