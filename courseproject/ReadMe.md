
### Class Project for "Getting and Cleaning Data"
#
#### Overview
#
The goal of this class project is to prepare tidy data that can be used for later analysis. The tidy dataset is created by means of a R script. Through a series of transformations steps detailed below, the R script reads the raw source data and creates a tidy dataset. Each step within the R script is outlined below. To create the tidy dataset, download tand run the script from the Github project site (see link below) to RStudio working directory.

For your reference, important details of the tidy dataset can be found the associated Codebook for this project.

The R script, Codebook and this Readme are hosted on Github at:

https://github.com/dineshj3d/Getting-and-Cleaning-Data/tree/master/courseproject

The raw source data was downloaded from the website at:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Additional information about the raw source data can be found at:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

#
#
#
####The R script transformation steps are as follows:

#
#
##### Step 1 - Download the zipped *UCI HAR Dataset* to working directory
#
#
#
##### Step 2 - Unzip the *UCI HAR Dataset*
#
#
#
##### Step 3 - Read the Activity and Features files
#
#
#
##### Step 4 - Prepare TRAIN Dataset by combing the X,y and subject datasets
#
#
#
##### Step 5 - Prepare TEST Dataset by combing the X,y and subject datasets
#
#
#
##### Step 6 - Merge TRAIN and TEST datasets 
#
#
#
##### Step 7 - Select variables to be included in tidy dataset 
#
#
#
##### Step 8 - Modify tidy dataset varaible names to be more readable and meaninful
#
#
#
##### Step 9 - Calculate tidy dataset means by subject and activity
#
#
#
##### Step 10 - Cleanup, rename tidy dataset variables  
#
#
#
##### Step 10 - Cleanup, rename tidy dataset variables 
#
#
#
##### Step 11 - Write tidy dataset to file
#
#
#
#####   Step 12 - Read tidy dataset and view in RStudio
#
#
#
#
####Additional notes (R script development)
- created and tested on only **Mac OS X Yosemite**
- **R version 3.2.0 (2015-04-16)**
- **Version 0.98.1103 – © 2009-2014 RStudio, Inc.**