#!/bin/bash


#Check to see if the script is running as root or with sudo 
if [[ "$(id -u)" -eq 0 ]]; then 
	echo "script is running as root" 

	echo $(which apt) 
	if [ "$(which apt)" = "/usr/bin/apt" ]; then
    		echo "apt is installed exactly as specified."
		
		apt install -y \
			nmap \
			dnsutils \
			libgl1-mesa-glx \
			libegl1-mesa \
			libxrandr2 \
		       	libxrandr2 \
		       	libxss1 \
			libxcursor1 \
		       	libxcomposite1 \
			libasound2 \
			libxi6 \
			libxtst6 
		curl -O https://repo.anaconda.com/archive/Anaconda3-2024.02-1-Linux-x86_64.sh
		bash :Anaconda3-2024.02-1-Linux-x86_64.sh
	

   	else
    		echo "apt is not installed at the specified location."
	fi



else 
	echo "You must run with root permissions" 1>&2 
	exit 1

fi 
