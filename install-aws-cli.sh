#!/bin/bash
#Taken from classmates, chat gpt and parts of the internet I have since lost
install-aws-cli(){
echo "installing aws cli"
	if [[ -n $(which unzip) ]]; then 
		sudo apt -y /
		unzip
	fi 
 
	if [[ -e $(ls awsdl/awscliv2.zip 2> /dev/null | head -1) ]]; then
		echo "AWS CLI V2 installer found, running it"
		unzip awsdl/awscliv2.zip -d awsdl/
		./awsdl/aws/install 
	else
		mkdir awsdl
		curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awsdl/awscliv2.zip"
		unzip awsdl/awscliv2.zip -d awsdl/
		./awsdl/aws/install
	fi 

}

install-aws-cli
