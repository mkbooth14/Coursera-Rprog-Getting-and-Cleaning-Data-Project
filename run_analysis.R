# Get data ----------------------------------------------------------------
# install.packages("downloader")
# library(downloader)
# download("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
# dest="dataset.zip", mode="wb") 
# unzip ("dataset.zip", exdir = ".")

library(data.table)
library(tidyverse)

# Activity labels ---------------------------------------------------------
act_label <- c(walking = 1, walking_upstairs = 2, walking_downstairs = 3, 
               sitting = 4, standing = 5, laying = 6)

# Position and (tidy) label of mean and std variables ----------------------------
variables <- fread("./UCI HAR Dataset/features.txt")
pos_mean_std <- grep(".*mean.*|.*std.*", variables$V2)
label_mean_std <- variables$V2[pos_mean_std]
label_mean_std <- gsub('-mean', 'Mean', label_mean_std)
label_mean_std <- gsub('-std', 'Std', label_mean_std)
label_mean_std <- gsub('[-()]', '', label_mean_std)

# Train dataset -----------------------------------------------------------
# First load in the three text files then select only the mean and std columns in the data
# then merge the files.
train_act <- fread("./UCI HAR Dataset/train/y_train.txt")
train_subject <- fread("./UCI HAR Dataset/train/subject_train.txt")
train_data <- fread("./UCI HAR Dataset/train/X_train.txt")
train <- train_data %>% select(pos_mean_std) %>%
    cbind(subject = train_subject, activity = train_act, .)

# Test dataset ------------------------------------------------------------
# Repeat train procedure for the test dataset.
test_act <- fread("./UCI HAR Dataset/test/y_test.txt")
test_subject <- fread("./UCI HAR Dataset/test/subject_test.txt")
test_data <- fread("./UCI HAR Dataset/test/X_test.txt")
test <- test_data %>% select(pos_mean_std) %>%
    cbind(subject = test_subject, activity = test_act, .)


# Merged dataset ----------------------------------------------------------
# Combine train and test data by rows then add in proper labels for activity and variables. 
dt <- rbind(train, test)
colnames(dt) <- c("subjectID","activity", label_mean_std)
match_act <- match(dt$activity, act_label)
dt$activity <- ifelse(is.na(match_act),
                            dt$activity,
                            names(act_label)[match_act])


# Average of each variable for each activity & subject ---------------------
dt_avg <- dt %>%
    group_by(subjectID, activity) %>%
    summarize_all(mean)

write.table(dt_avg, "tidy.txt", row.names = FALSE, quote = FALSE)


# Optional: clean workspace by removing intermediate objects --------------
rm(list=setdiff(ls(), c("dt", "dt_avg")))
