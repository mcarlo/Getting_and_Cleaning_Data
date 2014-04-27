This document describes the data set, variables and transformation methods used by run_analysis.R.

##COMPLETE DATA SET:

The origial data set used for this project is the Human Activity Recognition Using Smartphones Data Set published by University of California, Irvine's Machine Learning Repository at the Center for Machine Learning and Intelligent Systems.

###Data Set Information:

The experiment was conducted with a group of 30 volunteers aged 19-48. Each subject performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using the smartphone's embedded accelerometer and gyroscope, the experiments captured 3-axial linear acceleration and 3-axial angular velocity measurements at a constant rate of 50Hz. The experiments were video-recorded to label the data manually. The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers were selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

### Attribute Information:

For each record in the dataset it is provided:
	- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
	- Triaxial Angular velocity from the gyroscope.
	- A 561-feature vector with time and frequency domain variables.
	- Its activity label.
	- An identifier of the subject who carried out the experiment.

##TIDY DATA SET #1:

The script cleans and organizes the complete data set through the following tasks and outputs the results as a text file named "UCI HAR Dataset Extract.txt" within the user's working directory.  A file extension of .txt was selected to overcome upload limitaitons on Coursera.  Despite the file extension of .txt, the output should be treated as a comma-separated file and can be accessed using the read.csv funciton.

	* Combine a subject identifier, activity labels and a vector of 561 variables from 2,947 test observations into a tidy test data set
	* Combine a subject identifier, activity labels and a vector of 561 variables from 7,352 test observations into a tidy training data set
	* Row bind the tidy test and training data sets into a single tidy data set containing 10,299 observations across 563 variables (Subject, ActivityLabel, and 561 features)
	* Subset the tidy data set from step 3 above by extracting only those variables from the original vector of 561 features that a measure of the mean or standard deviation.  The result is a data set consisting of 10,299 	    observations across 68 variables.

##VARIABLE NAMES AND DEFINITIONS:
* Subject is a unique ID ranging from 1 to 30 which identifies the subject participant
* ActivityLabel is a character string identifying the type of activity observed for each record.  Values include WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING.  Character strings were associated with   ActivityLabels (which were integers from 1 to 6) by perfornming an inner join on te tidy data set and the original researchers' "activity_labels" file.
* 24 variables are obtained by calculating by calculating three means (one in each of the X, Y and Z direcitons) for the following eight variables from the researchers' original data set:  
	- tBodyAcc-XYZ
	- tGravityAcc-XYZ
	- tBodyAccJerk-XYZ
	- tBodyGyro-XYZ
	- tBodyGyroJerk-XYZ
	- fBodyAcc-XYZ
	- fBodyAccJerk-XYZ
	- fBodyGyro-XYZ
* 24 variables are obtained by calculating by calculating three standard deviations (one in each of the X, Y and Z direcitons) for the following eight variables from the researchers' original data set:  
	- tBodyAcc-XYZ
	- tGravityAcc-XYZ
	- tBodyAccJerk-XYZ
	- tBodyGyro-XYZ
	- tBodyGyroJerk-XYZ
	- fBodyAcc-XYZ
	- fBodyAccJerk-XYZ
	- fBodyGyro-XYZ
* 9 variables are obtained by calculating a single mean for each of the following nine variables from the researchers' original data set:  
	- tBodyAccMag
	- tGravityAccMag
	- tBodyAccJerkMag
	- tBodyGyroMag
	- tBodyGyroJerkMag
	- fBodyAccMag
	- fBodyAccJerkMag
	- fBodyGyroMag
	- fBodyGyroJerkMag
* 9 variables are obtained by calculating a single standard deviaition for each of the following nine variables from the researchers' original data set:  
	- tBodyAccMag
	- tGravityAccMag
	- tBodyAccJerkMag
	- tBodyGyroMag
	- tBodyGyroJerkMag
	- fBodyAccMag
	- fBodyAccJerkMag
	- fBodyGyroMag
	- fBodyGyroJerkMag

Detailed descriptions for each of these variables can be found in the "features_info.txt" file downloaded as part of the original .ZIP data set.

##TIDY DATA SET #2:

The second tidy data set produced by the script further subsets the first tidy data set by averaging each of the 66 feature variables by bth subject and activity.  The result is a data set contianing 180 observations, one for each subject and activity pair (30 subjects x 6 activities), across 66 feature variables.  The results are putput to a text file named "UCI HAR Dataset Extract by Mean and Subject Activity.txt" within the user's working directory.  A file extension of .txt was selected to overcome upload limitaitons on Coursera.  Despite the file extension of .txt, the output should be treated as a comma-separated file and can be accessed using the read.csv funciton.

All data for this project were used with permisison from the original researchers whose work is cited as follows:
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
