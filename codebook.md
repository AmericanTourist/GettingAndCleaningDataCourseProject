---
title: "Codebook"
author: "Jake Warner"
date: "May 24, 2016"
output: html_document
---


## Initial Features

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

## Unique Identifying Labels

* Subject - The person performing the actions. There are 30 subjects.
* Activity - The 6 different activities 
    + walking (1) 
    + walking upstairs (2) 
    + walking downstairs (3)
    + sitting (4)
    + standing (5)
    + laying (6)

## Each record provided:
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

## Measurement Variables. All 'Acc' are in units 'g' (9.8 m/s^2). All 'gryo' are in units of radians/second.

 [1] "tBodyAcc Mean X"                 "tBodyAcc Mean Y"                 "tBodyAcc Mean Z"                
 [4] "tBodyAcc Std Dev X"              "tBodyAcc Std Dev Y"              "tBodyAcc Std Dev Z"             
 [7] "tGravityAcc Mean X"              "tGravityAcc Mean Y"              "tGravityAcc Mean Z"             
[10] "tGravityAcc Std Dev X"           "tGravityAcc Std Dev Y"           "tGravityAcc Std Dev Z"          
[13] "tBodyAccJerk Mean X"             "tBodyAccJerk Mean Y"             "tBodyAccJerk Mean Z"            
[16] "tBodyAccJerk Std Dev X"          "tBodyAccJerk Std Dev Y"          "tBodyAccJerk Std Dev Z"         
[19] "tBodyGyro Mean X"                "tBodyGyro Mean Y"                "tBodyGyro Mean Z"               
[22] "tBodyGyro Std Dev X"             "tBodyGyro Std Dev Y"             "tBodyGyro Std Dev Z"            
[25] "tBodyGyroJerk Mean X"            "tBodyGyroJerk Mean Y"            "tBodyGyroJerk Mean Z"           
[28] "tBodyGyroJerk Std Dev X"         "tBodyGyroJerk Std Dev Y"         "tBodyGyroJerk Std Dev Z"        
[31] "tBodyAccMag Mean "               "tBodyAccMag Std Dev "            "tGravityAccMag Mean "           
[34] "tGravityAccMag Std Dev "         "tBodyAccJerkMag Mean "           "tBodyAccJerkMag Std Dev "       
[37] "tBodyGyroMag Mean "              "tBodyGyroMag Std Dev "           "tBodyGyroJerkMag Mean "         
[40] "tBodyGyroJerkMag Std Dev "       "fBodyAcc Mean X"                 "fBodyAcc Mean Y"                
[43] "fBodyAcc Mean Z"                 "fBodyAcc Std Dev X"              "fBodyAcc Std Dev Y"             
[46] "fBodyAcc Std Dev Z"              "fBodyAcc Mean Freq X"            "fBodyAcc Mean Freq Y"           
[49] "fBodyAcc Mean Freq Z"            "fBodyAccJerk Mean X"             "fBodyAccJerk Mean Y"            
[52] "fBodyAccJerk Mean Z"             "fBodyAccJerk Std Dev X"          "fBodyAccJerk Std Dev Y"         
[55] "fBodyAccJerk Std Dev Z"          "fBodyAccJerk Mean Freq X"        "fBodyAccJerk Mean Freq Y"       
[58] "fBodyAccJerk Mean Freq Z"        "fBodyGyro Mean X"                "fBodyGyro Mean Y"               
[61] "fBodyGyro Mean Z"                "fBodyGyro Std Dev X"             "fBodyGyro Std Dev Y"            
[64] "fBodyGyro Std Dev Z"             "fBodyGyro Mean Freq X"           "fBodyGyro Mean Freq Y"          
[67] "fBodyGyro Mean Freq Z"           "fBodyAccMag Mean "               "fBodyAccMag Std Dev "           
[70] "fBodyAccMag Mean Freq "          "fBodyBodyAccJerkMag Mean "       "fBodyBodyAccJerkMag Std Dev "   
[73] "fBodyBodyAccJerkMag Mean Freq "  "fBodyBodyGyroMag Mean "          "fBodyBodyGyroMag Std Dev "      
[76] "fBodyBodyGyroMag Mean Freq "     "fBodyBodyGyroJerkMag Mean "      "fBodyBodyGyroJerkMag Std Dev "  
[79] "fBodyBodyGyroJerkMag Mean Freq "


## Calculated Value
* The mean for each subject, based upon which activity they are doing is calculated for each of the 79 measurements.
