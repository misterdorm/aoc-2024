#!/bin/bash

# This script will read in a text file containing two columns of numbers
# The columns are separated by whitespace
# Sort each column from smallest to largest number
# Then, compare the two columns and calculate the distance between the two numbers in each row
# Keep a running total of the distance between the two columns, and report it at the end
# The input file is given as the first argument on the command line

# Check if the user provided an input file
if [ $# -eq 0 ]; then
    echo "Usage: $0 input_file"
    exit 1
fi

# Check if the input file exists
if [ ! -f $1 ]; then
    echo "Error: File $1 not found"
    exit 1
fi

# Sort each column from smallest to largest number
sort -n -k1,1 $1 | awk '{print $1;}' > sorted_col1.txt
sort -n -k2,2 $1 | awk '{print $2;}' > sorted_col2.txt

# Calculate the distance between the two columns in each row
paste sorted_col1.txt sorted_col2.txt | awk '{sum += ($1 > $2 ? $1 - $2 : $2 - $1)} END {print "Total distance: " sum}'

