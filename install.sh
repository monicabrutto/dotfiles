#!/bin/bash


#Check to see if the script is running as root or with sudo 
if [[ "$(id -u)" -eq 0 ]]; then 
	echo "script is running as root" 

	echo $(which apt) 
	if [ "$(which apt)" = "/usr/bin/apt" ]; then
    	   echo "apt is installed exactly as specified."
	else
    	   echo "apt is not installed at the specified location."
	fi



else 
	echo "You must run with root permissions" 1>&2 
	exit 1

fi 
