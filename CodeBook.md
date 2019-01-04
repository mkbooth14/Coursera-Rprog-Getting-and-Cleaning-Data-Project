# Code Book

This code book indicates all the variables and summaries calculated, along with units, and other relevant information in the [run_analysis.R](https://github.com/mkbooth14/Coursera-Rprog-Getting-and-Cleaning-Data-Project/blob/master/run_analysis.R) project. 


The data in this project represents the accelerometer and gyroscope 3-axial raw time domain signals tAcc-XYZ and tGyro-XYZ (prefix 't' to denote time) collected from the Samsung Galaxy S smartphone for 30 subjects performing 1 of 6 activities. The body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ), and the magnitude of these 3-D signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).


The mean and standard deviation (std) were estimated for these variables and these values and their corresponding labels are listed as variable columns in the tidy data sets. The averaged data set was obtained by taking the average of each measure for each activity and subject. The transformations made to the original data sets are detailed in [README.md](https://github.com/mkbooth14/Coursera-Rprog-Getting-and-Cleaning-Data-Project/blob/master/README.md).


## Identifiers
* `subjectID` - ID of the test subject (range 1 to 30)
* `activity`- laying, sitting, standing, walking, walking downstairs, or walking upstairs


## Measure
* tBodyAccMean(XYZ)
* tBodyAccStd(XYZ)
* tGravityAccMean(XYZ)
* tGravityAccStd(XYZ)
* tBodyAccJerkMean(XYZ)
* tBodyAccJerkStd(XYZ)
* tBodyGyroMean(XYZ)
* tBodyGyroStd(XYZ)
* tBodyGyroJerkMean(XYZ)
* tBodyGyroJerkStd(XYZ)
* tBodyAccMagMean(XYZ)
* tBodyAccMagStd(XYZ)
* tGravityAccMag(XYZ)
* tGravityAccMagStd(XYZ)
* tBodyAccJerkMagMean(XYZ)
* tBodyAccJerkMagStd(XYZ)
* tBodyGyroMagMean(XYZ)
* tBodyGyroMagStd(XYZ)
* tBodyGyroJerkMagMean(XYZ)
* tBodyGyroJerkMagStd(XYZ)
* fBodyAccMean(XYZ)
* fBodyAccStd(XYZ))
* fBodyAccJerkMean(XYZ)
* fBodyAccJerkStd(XYZ)
* fBodyGyroMean(XYZ)
* fBodyGyroStd(XYZ)
* fBodyAccMagMean(XYZ)
* fBodyAccMagStd(XYZ)
* fBodyAccJerkMagMean(XYZ)
* fBodyAccJerkMagStd(XYZ)
* fBodyGyroMagMean(XYZ)
* fBodyGyroMagStd(XYZ)
* fBodyGyroJerkMagMean(XYZ)
* fBodyGyroJerkMagStd(XYZ)


where 'XYZ' is used to denote 3-axial signals in the X, Y and Z directions. Acceleration signals are in standard gravity units 'g' and the angular velocity signals measured by the gyroscope are in units of radians/second.
