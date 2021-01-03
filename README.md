# run_analysis
#preparation: install.packages "dplyr"
#0. read txt files 

#1. Merges the training and the test sets to create one data set.   
  #merged X_test, X_train and column names
#2.Extracts only the measurements on the mean and standard deviation for each measurement. 
    #extract "mean" or "std" from features
    #remove colums which contain "meanFreq"
#3.Uses descriptive activity names to name the activities in the data set
    #merge x and y(activity)
    #add descriptive activity name

#tapply, summarise_each variables by using "tapply" function
    #create empty dataframe "summarize_each"
    
#write txt "summarize_each_variables"
    write.table(summarize_each_variables,"summarize_each_variables.txt",row.name=FALSE)
