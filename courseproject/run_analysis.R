##****************************************************************
## Step 1 - Download the zipped *UCI HAR Dataset* to working directory
##****************************************************************
    if (!file.exists("data")) {
        dir.create("data")
    }
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileUrl,destfile="./data/UCIHARDataset.zip",method="curl")
    list.files("./data")
    
##****************************************************************
## Step 2 - Unzip the *UCI HAR Dataset*
##****************************************************************
    
    unzip("./data/UCIHARDataset.zip", exdir="./data")


    ##  set file path to UCI HAR Dataset folder 
    wd_file_path <- file.path("./data")

    
##****************************************************************
## Step 3 - Read the Activity and Features files
##****************************************************************

    activity_labels <- read.table (file.path(wd_file_path,"UCI HAR Dataset","activity_labels.txt"), header = FALSE)

    colnames(activity_labels) <- c("activity_num","activity_desc")

    features <- read.table (file.path(wd_file_path,"UCI HAR Dataset","features.txt"))
    
    
##****************************************************************
##  Step 4 - Prepare TRAIN Dataset by combing the X,y and subject datasets
##****************************************************************

    X_TRAIN <- read.table (file.path(wd_file_path,"UCI HAR Dataset","train","X_TRAIN.txt"), header = FALSE, col.names = features[,2])
    
    y_TRAIN <- read.table (file.path(wd_file_path,"UCI HAR Dataset","train","y_TRAIN.txt"), header = FALSE)
    
    names(y_TRAIN)[1] <- "activity_num"
    
    subject_TRAIN <- read.table (file.path(wd_file_path,"UCI HAR Dataset","train","subject_TRAIN.txt"), header = FALSE)
    
    names(subject_TRAIN)[1] <- "subject_num"
    
    ##  combine TRAIN dataset
    
    X_TRAIN_activity  <- cbind(X_TRAIN,subject_TRAIN,y_TRAIN)

###****************************************************************
##  Step 5 - Prepare TEST Dataset by combing the X,y and subject datasets
##****************************************************************

    X_TEST <- read.table (file.path(wd_file_path,"UCI HAR Dataset","test","X_TEST.txt"), header = FALSE, col.names = features[,2])
    
    y_TEST <- read.table (file.path(wd_file_path,"UCI HAR Dataset","test","y_TEST.txt"), header = FALSE)
    
    names(y_TEST)[1] <- "activity_num"
    
    subject_TEST <- read.table (file.path(wd_file_path,"UCI HAR Dataset","test","subject_TEST.txt"), header = FALSE)
    
    names(subject_TEST)[1] <- "subject_num"   
   
    ##  COMBINE TEST DATASET
    
    X_TEST_activity  <- cbind(X_TEST,subject_TEST,y_TEST)
    
###****************************************************************
##  Step 6 - Merge TRAIN and TEST datasets 
##****************************************************************

    X_TRAIN_TEST_combined  <- rbind(X_TRAIN_activity, X_TEST_activity) 

## Extract only the measurements on the mean and standard deviation for each measurement. 
##    -  select mean and std columns to be included
##    -  Read TRAINING dataset y_TRAIN, name columm one(1) 'activity'
##    -  Combine X and y into a single dataset
## 
    
###****************************************************************
##  Step 7 - Select variables to be included in tidy dataset 
##****************************************************************

    mean_std_only_column_list <- c(1:6,41:46,81:86,121:126,
                                   161:166,201:202,214:215,227:228,
                                   240:241,253:254,266:271,345:350,
                                   424:429,503:504,516:517,
                                   529:530,542:543,562:563)
    
    X_TRAIN_TEST_combined <- subset(X_TRAIN_TEST_combined, select=mean_std_only_column_list)
    
    
###****************************************************************
##  Step 8 - Modify tidy dataset varaible names to be more readable and meaninful
##****************************************************************
 
    colnames(X_TRAIN_TEST_combined)<-gsub("Acc", "Accelerometer", colnames(X_TRAIN_TEST_combined))
    colnames(X_TRAIN_TEST_combined)<-gsub("Gyro", "Gyroscope", colnames(X_TRAIN_TEST_combined))
    colnames(X_TRAIN_TEST_combined)<-gsub("Mag", "Magnitude", colnames(X_TRAIN_TEST_combined))
    
    colnames(X_TRAIN_TEST_combined)<-gsub("^t", "time", colnames(X_TRAIN_TEST_combined))
    colnames(X_TRAIN_TEST_combined)<-gsub("^f", "frequency", colnames(X_TRAIN_TEST_combined))
    
    
    print ("dropped all except std and mean columns")
    
    cat("X_TRAIN_TEST_combined")
    cat  (str(X_TRAIN_TEST_combined))
    
###****************************************************************
##  Step 9 - Calculate tidy dataset means by subject and activity
##****************************************************************
    
    X_TRAIN_TEST_combined_tidy <-aggregate(X_TRAIN_TEST_combined, 
                                    by=list(X_TRAIN_TEST_combined$subject_num,
                                            X_TRAIN_TEST_combined$activity_num),
                                                FUN=mean, na.rm=TRUE)
     
###****************************************************************
##  Step 10 - Cleanup, rename tidy dataset variables 
##*****************************************************************
 
    ## rename group columns to Subject and Activity
    names(X_TRAIN_TEST_combined_tidy)[1] <- "Subject"
    names(X_TRAIN_TEST_combined_tidy)[2] <- "Activity"
    ## drop un-needed columns
    X_TRAIN_TEST_combined_tidy$subject_num <- NULL
    X_TRAIN_TEST_combined_tidy$activity_num <- NULL
    

    ## print tidy data sample to exam data set content and properties
    cat("X_TRAIN_TEST_combined_tidy")
    names(X_TRAIN_TEST_combined_tidy)
    dim(X_TRAIN_TEST_combined_tidy$subject_num <- NULL)
    cat  (str(X_TRAIN_TEST_combined_tidy))
    
##****************************************************************
##  Step 11 - Write tidy dataset to file
##****************************************************************

    ## write tidy data to file
    write.table (X_TRAIN_TEST_combined_tidy,file="TRAIN_TEST_tidy_data.txt",row.name=FALSE)

    
##****************************************************************
##  Step 12 - Read tidy dataset and view in RStudio
##****************************************************************  
    
    tidy_dataset <- read.table (file.path(getwd(),"TRAIN_TEST_tidy_data.txt"), header=TRUE)
    View(tidy_dataset)
