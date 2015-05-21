##  set working diretctory to UCI HAR Dataset folder 
wd_file_path <- getwd()
##

##****************************************************************
## Read Activity and Feature files
##****************************************************************

## Read Activity label file

    activity_labels <- read.table (file.path(wd_file_path,"UCI HAR Dataset","activity_labels.txt"), header = FALSE)

    colnames(activity_labels) <- c("activity_num","activity_desc")

   
## Read Features file 

    features <- read.table (file.path(wd_file_path,"UCI HAR Dataset","features.txt"))


##****************************************************************
## END - Activity and Feature files
##****************************************************************
    
##
## Prepare TRAIN dataset 
##    -  Read TRAIN dataset x_TRAIN, add column names from previously loaded features file
##    -  Read TRAIN  dataset y_TRAIN, name columm one(1) 'activity'
##    -  Combine X and y into a single datasets
## 

    X_TRAIN <- read.table (file.path(wd_file_path,"UCI HAR Dataset","train","X_TRAIN.txt"), header = FALSE, col.names = features[,2])
    
    y_TRAIN <- read.table (file.path(wd_file_path,"UCI HAR Dataset","train","y_TRAIN.txt"), header = FALSE)
    
    names(y_TRAIN)[1] <- "activity_num"
    
    subject_TRAIN <- read.table (file.path(wd_file_path,"UCI HAR Dataset","train","subject_TRAIN.txt"), header = FALSE)
    
    names(subject_TRAIN)[1] <- "subject_num"
    
    ##  COMBINE TRAINING DATASET
    
    X_TRAIN_activity  <- cbind(X_TRAIN,subject_TRAIN,y_TRAIN)

##
## Prepare TEST dataset 
##    -  Read TEST dataset x_TRAIN, add column names from previously loaded features file
##    -  Read TEST dataset y_TRAIN, name columm one(1) 'activity'
##    -  Combine X and y into a single datasets
## 

    X_TEST <- read.table (file.path(wd_file_path,"UCI HAR Dataset","test","X_TEST.txt"), header = FALSE, col.names = features[,2])
    
    y_TEST <- read.table (file.path(wd_file_path,"UCI HAR Dataset","test","y_TEST.txt"), header = FALSE)
    
    names(y_TEST)[1] <- "activity_num"
    
    subject_TEST <- read.table (file.path(wd_file_path,"UCI HAR Dataset","test","subject_TEST.txt"), header = FALSE)
    
    names(subject_TEST)[1] <- "subject_num"   
   
    ##  COMBINE TEST DATASET
    
    X_TEST_activity  <- cbind(X_TEST,subject_TEST,y_TEST)
    
    
##
## Merges the TRAIN & TEST datasets
##
##

    X_TRAIN_TEST_combined  <- rbind(X_TRAIN_activity, X_TEST_activity) 

## Extract only the measurements on the mean and standard deviation for each measurement. 
##    -  select mean and std columns to be included
##    -  Read TRAINING dataset y_TRAIN, name columm one(1) 'activity'
##    -  Combine X and y into a single dataset
## 

    mean_std_only_column_list <- c(1:6,41:46,81:86,121:126,
                                   161:166,201:202,227:228,
                                   240:241,266:271,345:350,
                                   424:429,504:504,516:517,
                                   529:530,542:543,562:563)
    
    X_TRAIN_TEST_combined <- subset(X_TRAIN_TEST_combined, select=mean_std_only_column_list)
    
    ## tidy up column names. Make syntactically valid names, consisting of letters, numbers and the dot
    ## or underline characters,  starts with a letter or the dot not followed by a number.
    
   
    
    colnames(X_TRAIN_TEST_combined)<-gsub("Acc", "Accelerometer", colnames(X_TRAIN_TEST_combined))
    colnames(X_TRAIN_TEST_combined)<-gsub("Gyro", "Gyroscope", colnames(X_TRAIN_TEST_combined))
    colnames(X_TRAIN_TEST_combined)<-gsub("Mag", "Magnitude", colnames(X_TRAIN_TEST_combined))
    
    colnames(X_TRAIN_TEST_combined)<-gsub("^t", "time", colnames(X_TRAIN_TEST_combined))
    colnames(X_TRAIN_TEST_combined)<-gsub("^f", "frequency", colnames(X_TRAIN_TEST_combined))
    
    ## colnames(X_TRAIN_TEST_combined) <- make.names(colnames(X_TRAIN_TEST_combined), unique=TRUE)
    
    ## colnames(X_TRAIN_TEST_combined) <- sub("Acc", "Acceleration", colnames(X_TRAIN_TEST_combined))
    ## colnames(X_TRAIN_TEST_combined) <- sub("t", "t_", colnames(X_TRAIN_TEST_combined))
    ##  gsub() replaces all instances of the pattern in each column name.
    ## sub() replaces only the first instance in each column name.
    
    print ("dropped all except std and mean columns")
    
    cat("X_TRAIN_TEST_combined")
    cat  (str(X_TRAIN_TEST_combined))
    
    ## From the data set in step 4, creates a second, independent 
    ## tidy data set with the average of each variable for each activity and each activity.
    
    X_TRAIN_TEST_combined_tidy <-aggregate(X_TRAIN_TEST_combined, 
                                    by=list(X_TRAIN_TEST_combined$subject_num,
                                            X_TRAIN_TEST_combined$activity_num),
                                                FUN=mean, na.rm=TRUE)
     
    ## rename group columns to Subject and Activity
    names(X_TRAIN_TEST_combined_tidy)[1] <- "Subject"
    names(X_TRAIN_TEST_combined_tidy)[2] <- "Activity"
    ## drop un-needed columns
    X_TRAIN_TEST_combined_tidy$subject_num <- NULL
    X_TRAIN_TEST_combined_tidy$activity_num <- NULL
    

    ## print tidy data sample to exam data set content and propertie
    cat("X_TRAIN_TEST_combined_tidy")
    names(X_TRAIN_TEST_combined_tidy)
    dim(X_TRAIN_TEST_combined_tidy$subject_num <- NULL)
    cat  (str(X_TRAIN_TEST_combined_tidy))

    ## write tidy data to file
    write.table (X_TRAIN_TEST_combined_tidy,file="TRAIN_TEST_tidy_data.txt",row.name=FALSE)
