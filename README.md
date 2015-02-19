#run_analysis.R

## This script works by:
1. import reshape for melt function
2. load data from working directory, this program assumes the unzipped file UCI HAR Dataset is in the current working directory
3. combines data test, train and activity label data
4. finds only measurements of standard deviation and mean
5. tidies variable names by lowercasing and removing punct
6. melts the data into tidy long format
7. aggregates the data by subject, activity and measurements type
8.  writes the table to a text file in the working directory named gettingAndCleaningDataProject.txt

Variable descriptions are avaliable in the code_book file

