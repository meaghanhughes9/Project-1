#!/bin/bash

# Create a variable for list of fave states 
nums=$(echo {0..9})
states=('hawaii' 'minnesota' 'colorado' 'montana') 

# Create a for loop that prints only 3, 5, and 7
for num in ${nums[@]}; 
do 
if [ $num = 3 ] || [ $num = 5 ] || [ $num = 7 ];
then
echo $num 
fi
done

# Create a loop that looks for Hawaii
for state in ${states[@]}
do
if [ $state == 'hawaii' ];
then
echo "Hawaii is the best!"
else
echo "I'm not a fan"
fi 
done

