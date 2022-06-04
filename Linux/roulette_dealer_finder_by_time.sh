#!/bin/bash 

echo -n "Enter date using the format \"mmdd\": "
read file
echo -n "Enter hour in two digit form: " #this variable should be only the hour, for example "10" meaning hour 10. On the followng variable the AM or PM will be entered. 
read time
echo -n "Enter pm or am: " #Enter am or pm
read moraft

cat $file* |  awk '{ print $1 " " $2 "\t" $5 " " $6 }' | grep  $time | grep -i $moraft # Filter based on the user input the roulette dealear 
