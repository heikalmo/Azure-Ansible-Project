#!/bin/bash


# must follow format of MMDD HH AM/PM

find -type f -name *$1* -exec grep  $2:00:00.*$3 {} + | awk '{print $5, $6}'
