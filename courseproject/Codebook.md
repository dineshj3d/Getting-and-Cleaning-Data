#

###Project Artifacts

####Code Book

#
DescribeDescribeDescribeDescribeDescribeDescribeDescribeDescribeDescribeDescribeDescribeDescribe
DescribeDescribeDescribeDescribeDescribeDescribeDescribeDescribeDescribeDescribeDescribeDescribe
DescribeDescribeDescribeDescribeDescribeDescribeDescribeDescribeDescribeDescribeDescribeDescribe
DescribeDescribeDescribeDescribeDescribeDescribeDescribeDescribeDescribeDescribeDescribeDescribe
DescribeDescribeDescribeDescribeDescribeDescribeDescribeDescribeDescribeDescribeDescribeDescribe
DescribeDescribeDescribeDescribeDescribeDescribeDescribeDescribeDescribeDescribeDescribeDescribe
#
#
 
####ReadMe

#
DescribeDescribeDescribeDescribeDescribeDescribeDescribeDescribeDescribeDescribeDescribeDescribe
DescribeDescribeDescribeDescribeDescribeDescribeDescribeDescribeDescribeDescribeDescribeDescribe
DescribeDescribeDescribeDescribeDescribeDescribeDescribeDescribeDescribeDescribeDescribeDescribe
DescribeDescribeDescribeDescribeDescribeDescribeDescribeDescribeDescribeDescribeDescribeDescribe
DescribeDescribeDescribeDescribeDescribeDescribeDescribeDescribeDescribeDescribeDescribeDescribe
DescribeDescribeDescribeDescribeDescribeDescribeDescribeDescribeDescribeDescribeDescribeDescribe
#
#

####Raw data 

Raw data is from the UCI Machine Learning repository: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

It was created as a result of experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Attribute Information:

For each record in the dataset it is provided:

Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
Triaxial Angular velocity from the gyroscope.
A 561-feature vector with time and frequency domain variables.
Its activity label.An identifier of the subject who carried out the experiment.

See **README** for more information how this raw data set is transformed into a tidy dataset read for analysis


#
#

activity_labels.txt                         
features_info.txt                           
features.txt                                

subject_test.txt     subject_train.txt                        
X_test.txt           X_train.txt             
y_test.txt           y_train.txt          

####R Script
#
#
Called run_analysis.R, it downloads the raw dataset and re-arranges into it into a tidy dataset.
See details script fucntionality in ReadMe and comments within the script.

Lastly, the script will create a tidy data set containing the means of
all the columns per test **Subject** and per **Activity**. This tidy dataset
will be written to a file called **TRAIN_TEST_tidy_data.txt** (see sample submitted as of this Coursera project assigment). This dataset is further explained below under **Tidy dataset**

#
#
####Tidy dataset
#
#

The tidy dataset layout is outlines below.

*  Subject
*  Activity
  
*  timeBodyGyroscope.mean...Z
*  timeBodyGyroscope.std...X
*  timeBodyGyroscope.std...Y
*  timeBodyGyroscope.std...Z

*  timeBodyGyroscopeJerk.mean...X
*  timeBodyGyroscopeJerk.mean...Y
*  timeBodyGyroscopeJerk.mean...Z
*  timeBodyGyroscopeJerk.std...X
*  timeBodyGyroscopeJerk.std...Y
*  timeBodyGyroscopeJerk.std...Z

*  timeBodyAccelerometerMagnitude.mean..
*  timeBodyAccelerometerMagnitude.std..
*  timeBodyAccelerometerJerkMagnitude.mean..
*  timeBodyAccelerometerJerkMagnitude.std..

*  timeBodyGyroscopeMagnitude.mean..
*  timeBodyGyroscopeMagnitude.std..


*  frequencyBodyAccelerometer.mean...X
*  frequencyBodyAccelerometer.mean...Y
*  frequencyBodyAccelerometer.mean...Z
*  frequencyBodyAccelerometer.std...X
*  frequencyBodyAccelerometer.std...Y
*  frequencyBodyAccelerometer.std...Z

*  frequencyBodyAccelerometerJerk.mean...X
*  frequencyBodyAccelerometerJerk.mean...Y
*  frequencyBodyAccelerometerJerk.mean...Z
*  frequencyBodyAccelerometerJerk.std...X
*  frequencyBodyAccelerometerJerk.std...Y
*  frequencyBodyAccelerometerJerk.std...Z

*  frequencyBodyGyroscope.mean...X
*  frequencyBodyGyroscope.mean...Y
*  frequencyBodyGyroscope.mean...Z
*  frequencyBodyGyroscope.std...X
*  frequencyBodyGyroscope.std...Y
*  frequencyBodyGyroscope.std...Z
 
*  frequencyBodyAccelerometerMagnitude.std..
*  frequencyBodyBodyAccelerometerJerkMagnitude.mean..
*  frequencyBodyBodyAccelerometerJerkMagnitude.std..

*  frequencyBodyBodyGyroscopeMagnitude.mean..
*  frequencyBodyBodyGyroscopeMagnitude.std..
*  frequencyBodyBodyGyroscopeJerkMagnitude.mean..
*  frequencyBodyBodyGyroscopeJerkMagnitude.std..
