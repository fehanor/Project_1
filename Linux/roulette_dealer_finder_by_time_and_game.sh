#!/bin/bash 

echo -n "Enter date using the format \"mmdd\": "
read file
echo -n "Enter hour in two digit form: "
read time
echo -n "Enter pm or am: " 
read moraft

#cat $file* |  awk '{ print $1 " " $2 "\t" $5 " " $6 }' | grep  $time | grep -i $moraft # Filter based on the user input the roulette dealear 



  echo "
  1. Roulette  
  2. Blackjack 
  3. Texas Hold
  "
  read -p "Your choice (1 to 3): " choice

  # case code
  case $choice in
          1)      cat $file* |  awk '{ print $1 " " $2 "\t" $5 " " $6 }' | grep  $time | grep -i $moraft # Filter based on the user input the roulette dealear
                  exit
                  ;;
          2)      cat $file* |  awk '{ print $1 " " $2 "\t" $3 " " $4 }' | grep  $time | grep -i $moraft # Filter based on the user input the roulette dealear 
                  exit
                  ;;
          3)      cat $file* |  awk '{ print $1 " " $2 "\t" $7 " " $8 }' | grep  $time | grep -i $moraft # Filter based on the user input the roulette dealear
                  exit
                  ;;
          *)      echo "Invalid selection"
                  exit
                  ;;
  esac
