library(plyr)
#assumes the data has been unzipped into the current working directory

setwd("./UCI HAR Dataset")

#read the features - this is used later to assign colmnames to our dataframe

# read the test datasets into memory
file_a <- "activity_labels.txt"
file_f <- "features.txt"
test_s <- "test/subject_test.txt"
test_y<-  "test/y_test.txt"
test_x <- "test/X_test.txt"
train_s <- "train/subject_train.txt"
train_y<-  "train/y_train.txt"
train_x <- "train/X_train.txt"

#Load all of the data
feature<-read.table(file_f, header=FALSE, stringsAsFactors=FALSE)
activity <- read.table(file_a, header=FALSE, stringsAsFactors=FALSE)

subject_test <- read.table( test_s, header=FALSE, stringsAsFactors=FALSE, col.names = "subject")
y_test <- read.table(test_y, header=FALSE, stringsAsFactors=FALSE, col.names = "activity")
x_test <- read.table(test_x, header=FALSE, stringsAsFactors=FALSE)
subject_train <- read.table( train_s, header=FALSE, stringsAsFactors=FALSE, col.names = "subject")
y_train <- read.table(train_y, header=FALSE, stringsAsFactors=FALSE,col.names = "activity")
x_train <- read.table(train_x, header=FALSE, stringsAsFactors=FALSE)

#merge the data 
#as per step 1 of the requirement

test<- cbind( subject_test, y_test,x_test)
train<- cbind(subject_train, y_train,x_train)
full_set <- rbind(train, test)


#extracting mean and std data
#as per step 2 of the assignment
meanstd<-full_set[,c(c(1:2),grep("mean|std",feature[,2])+2)]
cols<-grep("mean|std",feature[,2])


#replace the activity codes with the names from the activity dataset
# as per step 3 of the assignment
meanstd$activity<-as.factor(meanstd$activity)
levels(meanstd$activity)<-activity$V2


#assign column names from the 2nd cloumn of the features dataset and the last two (appened) columns are  subject and activity
#as per step 4 of the assignment
colnames(meanstd) <- c("subject","activity",feature[cols,2])

# get the means of each measure by subject and activity

tidy<-ddply(meanstd, c("subject","activity"),summarise,Means=colMeans(meanstd[3:(length(names(meanstd)))]))
measurenames <-colnames(meanstd[,3:81])
tidy$measurename<-activitynames

write.table(tidy, "tidy.txt",row.names=FALSE)


