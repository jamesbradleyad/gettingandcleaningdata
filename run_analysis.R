#import reshape for melt function
require(reshape)
#load data from working directory
X_train <- read.csv('.\\UCI HAR Dataset\\train\\X_train.txt', header=FALSE, sep="")
X_test <- read.csv('.\\UCI HAR Dataset\\test\\X_test.txt', header=FALSE, sep="")
y_train <- read.csv('.\\UCI HAR Dataset\\train\\y_train.txt', header=FALSE, sep="")
y_test <- read.csv('.\\UCI HAR Dataset\\test\\y_test.txt', header=FALSE, sep="")
subject_train <-read.csv('.\\UCI HAR Dataset\\train\\subject_train.txt', header=FALSE, sep="")
subject_test <-read.csv('.\\UCI HAR Dataset\\test\\subject_test.txt', header=FALSE, sep="")
n <- read.csv('.\\UCI HAR Dataset\\features.txt', header=FALSE, sep="")
an <- read.csv('.\\UCI HAR Dataset\\activity_labels.txt', header=FALSE, sep="")
names(an)<- c('V1','activity')
#combine data
X =rbind(X_train,X_test)
y =rbind(y_train,y_test)
S =rbind(subject_train,subject_test)
names(X)<- n$V2
#grep for needed columns
X<-X[,grep("sum()|std()", names(X), value=TRUE)]
names(S)<- 'subject'
X<-cbind(S,X, y)
#join activity label
X <-merge(X,an, by= 'V1')
X$V1 <- NULL
# tidy variable names by lowercasing and removing punct
names(X)<- tolower(gsub('[])|(|-]','',names(X)))
#melt into tidy long format
stacked <-melt(X, id.vars=c('subject','activity'),var='measure')
tidydata <-aggregate(stacked[,4], list(stacked$subject,stacked$activity,stacked$variables), mean)
names(tidydata)<-names(stacked)
#write table to txt
write.table(tidydata, file='gettingAndCleaningDataProject.txt' ,row.name=F) 
