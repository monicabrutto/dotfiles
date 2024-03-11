#!/bin/bash


#Check to see if the script is running as root or with sudo 
if [[ $EUID -ne 0 ]];  

then 
	echo "You must run with root permissions" 1>&2 
	exit 1

fi 
