#read txt 
x_test<-read.table("X_test.txt")
y_test<-read.table("y_test.txt")
x_train<-read.table("X_train.txt")
y_train<-read.table("y_train.txt")
features<-read.table("features.txt")
#merge test and train
merged_data<-rbind(x_test,x_train)
merged_data_y<-rbind(y_test,y_train)
#change column names
names(merged_data)<-features[,2]
#extract "mean" or "std" from features
mean_std<-grep("mean|std",features[,2])
extract_merged_data<-merged_data[,mean_std]
#merge x and y(activity)
merged_xy<-cbind(extract_merged_data,merged_data_y)
