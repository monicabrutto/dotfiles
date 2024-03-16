#!/bin/bash
#Taken from classmates, chat gpt and parts of the internet I have since lost
install-aws-cli(){

read -rp "[PROMPT] Do you want to install aws cli? (y/n):" choice 

choice=$(echo -e "$choice" | tr '[:upper:]' '[:lower:]')

if [[ "$choice" == "y" | "$choice" == "yes" ]]; then 

	if [[ -n $(which unzip) ]]; then 
		sudo apt -y /
		unzip
	fi 
 
	curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
	unzip awscliv2.zip
	sudo ./aws/instal
 elif [[ "$choice" == "n" || "$choice" == "no" ]]; then 
 	echo "not installing" 
  	exit 0
else 
	echo "Invalid chocie, please enter either yes or no"
 	exit 1
fi

}

install-aws-cli
