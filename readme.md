---
title: "Course Project Readme File - Getting and Cleaning Data"
author: "Jake Warner"
date: "May 24, 2016"
output: html_document
---


## What these scripts are all about

* run_analysis.R will download the gryo and accel data for 30 subjects doing 6 different
activities.
* It will then merge the two data sets, clean up the names, and make each row one observation.
* Then it will find the mean for each subject for each activity.
* Finally, it stores it in an output file called "tidy.txt"

## In the end, we have 3 files pertaining to this project.
1. run_analysis.R
2. tidy.txt
3. codebook.md
4. readme.md
