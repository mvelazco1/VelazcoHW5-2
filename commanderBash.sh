#!/bin/bash

# This Bash Script takes no arguments
# This Bash script invokes led-hw5.sh in the order below

# 1st command is to turn on LED.
# 2nd command is to turn off LED.
# 3rd command is to read status.
# 4th command is to flash LED.
# 5th command is to blink LED 3x.



echo -e "Do 1st command -> turn on LED" 
./led-hw5.sh on

echo -e "Do 2nd command -> turn off LED"
./led-hw5.sh off

echo -e "Do 3rd command -> read status"
./led-hw5.sh status

echo -e "Do 4th command -> flash LED"
./led-hw5.sh flash 

echo -e "Do 5th command -> blink LED 3x"
./led-hw5.sh blink 3 








































