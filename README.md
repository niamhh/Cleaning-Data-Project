
# Cleaning-Data-Project
##Script: run_analysis.R
The script does the following
  * Loads the data from the unzipped data file in the working directory
  * Loads all relevant data into individual dataframes.
  * Merges the subject and activity dataframes  with the test and training measurement datafiles
  * Merges the training and test dataframes
  * Extracts all the measurements containing "mean" or "std" in its title
  * Calculates the mean by subject and activity for each relevent measurement and saves it into a new dataframe
  * adds the name of the measure as an additional column
  
The data are tidy because 
* Each variable forms a column.
* Each observation forms a row.
* Each type of observational unit forms a table. 

##Notes on the Original Data
The original data was collected from here
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
A fuller explanantion of the original measurements can be got there.

The data set used for this analysis was from here
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
