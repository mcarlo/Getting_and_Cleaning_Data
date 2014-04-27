This file describes the assumptions and methods underlying run_analysis.R ("the script").

##ASSUMPITONS:

The script was developed and tested on a PC with the following resources:

* Processor: Intel(R) Core(TM) i7-3770 CPU @ 3.40GHz
* Installed RAM : 16.0 GB
* System Type: 64-bit operating system , x64-based processor
* Operating System: Windows 8.1
* Network Connectivity: 15 Mbps broadband cable
* Integrated Development Environment: RStudio, version 0.98.501
* R Software Version: R x64 3.0.3

Unexpected results may arise if run on a machine that does not meet any of these minimum system requirements.

##METHODS:

The script begins by checking for the presensce of a subdirectory named "data" within the user's working directory in RStudio. If not present, the data subdirectory is created.  Next, the script checks for the presence of a file named "dataset.zip" within the data subdirectory.  If the file does not exist, it is downloaded from the URL: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The entire .zip file is then extracted to a new sub-dirctory named "UCI HAR Dataset" within the data subdirectory.  

##OUTPUT:

The script writes two distinct text files to the data subdirectory as follows:

* "UCI HAR Dataset Extract.csv" subsets the combined training and test sets from the complete UCI HAR Dataset by including only those variables that are either a mean or standard deviation for each measurement from the complete file.
* "UCI HAR Dataset Mean by Subject and Activity" further subsets "UCI HAR Dataset Extract.csv" by including only a mean of each included variable by subject ID and activity type.

Detailed descriptions of the data set, individual variables and transformaiton methods can be found in the CodeBook.md mark-down file within this Github repository.




