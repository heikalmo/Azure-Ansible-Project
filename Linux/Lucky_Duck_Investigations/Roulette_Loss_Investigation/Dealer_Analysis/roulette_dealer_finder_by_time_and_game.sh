#!/bin/bash


# must follow format of MMDD HH AM/PM 
#will print the time and names of players in all the games

find -type f -name *$1* -exec head -1 {} +
find -type f -name *$1* -exec grep  $2:00:00.*$3 {} + | awk '{print $1, $2 ,"       "$3, $4, "                      "$5 ,$6 ,"                 "$7 , $8}'

#find -type f -name *$1* -exec grep $2:00:00.*$3 {} + 
#the code above can also be used as a simple print of the line found but i wanted to format the output to have tabs
