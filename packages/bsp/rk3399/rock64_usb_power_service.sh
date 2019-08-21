#!/bin/bash
# rock64_usb_power_service.sh
#
# Mark H. Harris
# v0.1b
#
#
PWRON=0
PWROFF=1
GP=2
GPOUT="out"
GPPATH="/sys/class/gpio"
GPVALUE="value"
GPMODE="direction"

## remove gpio if already exported
if [ -d $GPPATH/gpio$GP ]
then
 echo $GP > $GPPATH/unexport
 sleep 2
fi

# export the gpio, and set if ready
echo $GP > $GPPATH/export
sleep 2
if [ -e $GPPATH/gpio$GP/$GPMODE ]
then
 echo $GPOUT > $GPPATH/gpio$GP/$GPMODE
 sleep 2
 echo $PWRON > $GPPATH/gpio$GP/$GPVALUE
fi

