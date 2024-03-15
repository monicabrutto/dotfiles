#!/bin/bash

install-aws-cli(){


if [[ -n $(which unzip) ]]; then 

	sudo apt -y /
	unzip
	
	curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
	unzip awscliv2.zip
	sudo ./aws/install






}

install-aws-cli
