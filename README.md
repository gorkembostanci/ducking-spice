In  this repository, I present an R script for the course project of Getting and Cleaning Data course in the Data Science track.
A full description is available at the site where the data was obtained: 

    http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

    https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The main purposes of this script are, 

*Merges the training and the test sets to create one data set.
*Extracts only the measurements on the mean and standard deviation for each measurement. 
*Uses descriptive activity names to name the activities in the data set
*Appropriately labels the data set with descriptive variable names. 
*From the data set in step 4, creates a second, independent tidy data set with the average 
of each variable for each activity and each subject.

In the first part, the scripts loads the datasetes into R. One must set the working directory as the folder
of the dataset in order for this to work. 

    subject_test<-read.table(paste(getwd(),"/test/subject_test.txt",sep=""), header=FALSE)
    X_test<-read.table(paste(getwd(),"/test/X_test.txt",sep=""), header=FALSE)
    subject_train<-read.table(paste(getwd(),"/train/subject_train.txt",sep=""), header=FALSE)
    X_train<-read.table(paste(getwd(),"/train/X_train.txt",sep=""), header=FALSE)
    y_test<-read.table(paste(getwd(),"/test/y_test.txt",sep=""), header=FALSE)
    y_train<-read.table(paste(getwd(),"/train/y_train.txt",sep=""), header=FALSE)
    features<-read.table(paste(getwd(),"/features.txt",sep=""), header=FALSE)
    ActNames<-read.table(paste(getwd(),"/activity_labels.txt",sep=""), header=FALSE)


In the second part, the script creates the required variable names vector from the features file in the original dataset.

    features<-t(features)
    features<-features[2,]
    features<-append("activityname",features)
    features<-append("activity",features)
    features<-append("subject",features) 

Then the code joins y and x variables into one and forms the test and train sets.


    test<-cbind(subject_test,y_test,X_test)
    train<-cbind(subject_train,y_train,X_train)

Later, it sets variable names for activity variable for easy merging, then merges the sets to replace mactivity numbers
with activity names.

    colnames(ActNames) <- c("activity","act_name")
    colnames(test)[2]<-"activity"
    colnames(train)[2]<-"activity"
    Mtest<-merge(ActNames, test, by="activity")
    Mtrain<-merge(ActNames, train, by="activity")

Fifthly, the script reorders variables and names them for tidy representation, while appending test and train sets.

    Mtest<-Mtest[,c(3,1:2,4:564)]
    Mtrain<-Mtrain[,c(3,1:2,4:564)]
    data <- rbind(Mtest,Mtrain)
    colnames(data) <- features

In the sixth part, the script extracts the variables which include mean or std in its name and drops the 
currently useless activity number variable

    subsetDatamean<- data[,grep("mean", colnames(data))] 
    subsetDatastd<- data[,grep("std", colnames(data))]
    dataMS <- cbind(data[,1:3],subsetDatamean,subsetDatastd)
    dataMS<- dataMS[,c(1,3:82)]

Lastly, the script generates a new dataset by taking averages over subjects and activities and writes the output file.

    datameans <- dataMS %>% group_by(subject, activityname) %>%   summarise_each(funs(mean))
    write.table(datameans,file="SamsungMeans.txt",row.names=FALSE)

