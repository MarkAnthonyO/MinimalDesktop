#!/bin/sh
yad --center --image="data-information" --text="The PC will shutting down, are you sure?" --button="Shutting down":0 --button="Cancel":1

ans=$?

if [ $ans -eq 0 ]
then
	echo "Shutting down"
	shutdown now

else
	echo "Canceling"
fi
