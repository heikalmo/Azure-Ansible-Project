#!/bin/bash

# Use script bash with  HH AM/PM
# this will search all files in directory for the time mentioned.

grep $1:00:00.*$2 * | awk '{print $5, $6}'
