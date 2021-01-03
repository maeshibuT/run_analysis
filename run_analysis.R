#install.packages "dplyr"
install.packages("dplyr")
library(dplyr)

#read txt 
x_test<-read.table("test/X_test.txt")
y_test<-read.table("test/y_test.txt")
x_train<-read.table("train/X_train.txt")
y_train<-read.table("train/y_train.txt")
features<-read.table("features.txt")
activity_labels<-read.table("activity_labels.txt")

#1. Merges the training and the test sets to create one data set.   
    #merge test and train
        merged_data<-rbind(x_test,x_train)
        merged_data_y<-rbind(y_test,y_train)
    #add column names
        names(merged_data)<-features[,2]
#2.Extracts only the measurements on the mean and standard deviation for each measurement. 
    #extract "mean" or "std" from features
        extract_merged_data<-merged_data %>% select(contains(c("mean","std")))
    #remove colums which contain "meanFreq"
        extract_merged_data<-extract_merged_data %>%select(-contains("meanFreq"))
#3.Uses descriptive activity names to name the activities in the data set
    #merge x and y(activity)
        merged_xy<-cbind(merged_data_y,extract_merged_data)
    #add descriptive activity name
        for (i in 1:length(merged_xy$V1)){
            if (merged_xy[i,1]==1){
                merged_xy$activity[i]<-"WALKING"}
            else if (merged_xy[i,1]==2){
                merged_xy$activity[i]<-"WALKING_UPSTAIRS"}
            else if (merged_xy[i,1]==3){
                merged_xy$activity[i]<-"WALKING_DOWNSTAIRS"}
            else if (merged_xy[i,1]==4){
                merged_xy$activity[i]<-"SITTING"}
            else if (merged_xy[i,1]==5){
                merged_xy$activity[i]<-"STANDING"}    
            else if (merged_xy[i,1]==6){
                merged_xy$activity[i]<-"LAYING"}
        }

#tapply, summarise_each
    #create empty dataframe "summarize_each"
    summarize_each<-merged_xy[1:6,2:74]
    for (j in 2:74){
        summarize_each[,j-1]<-tapply(merged_xy[,j],merged_xy[,1],mean)
    }
    activity<-activity_labels$V2
    summarize_each_variables<-cbind(activity,summarize_each)
    
#write txt "summarize_each_variables"
    write.table(summarize_each_variables,"summarize_each_variables.txt",row.name=FALSE)