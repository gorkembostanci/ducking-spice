library(dplyr)

## Getting the required data

subject_test<-read.table(paste(getwd(),"/test/subject_test.txt",sep=""), header=FALSE)
X_test<-read.table(paste(getwd(),"/test/X_test.txt",sep=""), header=FALSE)
subject_train<-read.table(paste(getwd(),"/train/subject_train.txt",sep=""), header=FALSE)
X_train<-read.table(paste(getwd(),"/train/X_train.txt",sep=""), header=FALSE)
y_test<-read.table(paste(getwd(),"/test/y_test.txt",sep=""), header=FALSE)
y_train<-read.table(paste(getwd(),"/train/y_train.txt",sep=""), header=FALSE)
features<-read.table(paste(getwd(),"/features.txt",sep=""), header=FALSE)
ActNames<-read.table(paste(getwd(),"/activity_labels.txt",sep=""), header=FALSE)



## Creating variable names using feature file 

features<-t(features)
features<-features[2,]
features<-append("activityname",features)
features<-append("activity",features)
features<-append("subject",features) 

#Forming test and train sets

test<-cbind(subject_test,y_test,X_test)
train<-cbind(subject_train,y_train,X_train)

## Setting the variable names for successful merging

colnames(ActNames) <- c("activity","act_name")
colnames(test)[2]<-"activity"
colnames(train)[2]<-"activity"

## Merging the datasets to replace activity numbers with names

Mtest<-merge(ActNames, test, by="activity")
Mtrain<-merge(ActNames, train, by="activity")

## Reordering columns for tidy representation

Mtest<-Mtest[,c(3,1:2,4:564)]
Mtrain<-Mtrain[,c(3,1:2,4:564)]

## Appending train and test sets and naming the variables for tidy representation

data <- rbind(Mtest,Mtrain)
colnames(data) <- features

## Extracting the variables corresponding to means and Std. deviations

subsetDatamean<- data[,grep("mean", colnames(data))] 
subsetDatastd<- data[,grep("std", colnames(data))]
dataMS <- cbind(data[,1:3],subsetDatamean,subsetDatastd)
dataMS<- dataMS[,c(1,3:82)]

## Generating a new dataset by taking means over subjects and activities

datameans <- dataMS %>% group_by(subject, activityname) %>%   summarise_each(funs(mean))

## Writing the dataset

write.table(datameans,file="SamsungMeans.txt",row.names=FALSE)