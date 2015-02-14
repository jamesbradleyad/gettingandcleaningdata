#run_analysis.R

## This script works by:
- import reshape for melt function
- load data from working directory, this program assumes the unzipped file UCI HAR Dataset is in the current working directory in 
- combines data test, train and activity label data
- finds only measurements of standard deviation and mean
- tidies variable names by lowercasing and removing punct
- melts the data into tidy long format
- aggregates the data by subject, activity and measurements type
-  writes the table to a text file in the working directory named gettingAndCleaningDataProject.txt

