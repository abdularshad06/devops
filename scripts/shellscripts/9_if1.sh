#!/bin/bash

read -p "Enter a Number: " NUM
echo

if [ $NUM -gt 100 ]
then
    echo "We have entered in IF Block."
    sleep 3
    echo "Your Number is greater than 100"
    echo
    date
else
    echo "You have entered number is less than 100"
fi

echo "Script execution completed successfully."