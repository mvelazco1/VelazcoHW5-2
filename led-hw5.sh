#!/bin/bash
# A small Bash script to set up User LED3 to be turned on or off from 
#  Linux console. Written by Derek Molloy (derekmolloy.ie) for the 
#  book Exploring BeagleBone.

LED3_PATH=/sys/class/leds/beaglebone:green:usr3

# Example bash function
function removeTrigger
{
  echo "none" >> "$LED3_PATH/trigger"
}

echo "Starting the LED Bash Script"
if [ $# -eq 0 ]; then
  echo "There are no arguments. Usage is:"
  echo -e " bashLED Command \n  where command is one of "
  echo -e "   on, off, flash or status  \n e.g. bashLED on "
  exit 2
fi
echo "The LED Command that was passed is: $1"
if [ "$1" == "on" ]; then
  echo "Turning the LED on"
  removeTrigger
  echo "1" >> "$LED3_PATH/brightness"
elif [ "$1" == "off" ]; then
  echo "Turning the LED off"
  removeTrigger
  echo "0" >> "$LED3_PATH/brightness"
elif [ "$1" == "flash" ]; then
  echo "Flashing the LED"
  removeTrigger
  echo "timer" >> "$LED3_PATH/trigger"
  sleep 1
  echo "100" >> "$LED3_PATH/delay_off"
  echo "100" >> "$LED3_PATH/delay_on"
elif [ "$1" == "status" ]; then
  cat "$LED3_PATH/trigger";
# 1. Your script shall accept two new command line arguments called blink and an integer n.
elif [ "$1" == "blink" ] && [ "$2" -gt 0 ]; then
 echo "Blinking $1 USR3 @ LED $2 times"
 removeTrigger
 for (( i=1; i<=$2; i++ )) # what this does is it runs the loop $2 n times 
 do
	 echo "1" >> "$LED3_PATH/brightness" # this turns  on the LED light
	 sleep 1		            # holds for 1 sec
	 echo "0" >> "$LED3_PATH/brightness" # this turns off the LED light 
	 sleep 1                            # holds for 1 sec
done

# end of hw problem 
fi
echo "End of the LED Bash script"

 














