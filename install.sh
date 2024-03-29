#!/bin/bash
# get username that called script
# from Kayleigh Duncan
echo $SUDO_USER
ME=$SUDO_USER
script_path_one="/home/ubuntu/dotfiles/install-aws-cli.sh"
script_path_two="/home/ubuntu/dotfiles/install-vundle.sh"

# check if effective user id is 0 (root)

if [[ "$(id -u)" -eq 0 ]]; then
	echo "Script is running as root"
	# check if apt is package manager
	# if apt is package manager and you run which apt it will specify a path to where its stored
	echo $(which apt)
	if [[ -n "$(which apt)" ]]; then
		echo "apt is installed exactly as specified."
		apt install -y \
			greed \
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
		if [[ -e $(ls Anaconda3*.sh 2> /dev/null | head -1) ]]; then
			echo "Installer found, running it"
		        bash Anaconda3-2024.02-1-Linux-x86_64.sh -b -p /home/$ME/anaconda3
			echo "PATH=$PATH:/home/kduncan/anaconda3/bin" >> /home/$ME/.profile
	        else
	 		echo "Downloading anaconda installer"		
			curl -O https://repo.anaconda.com/archive/Anaconda3-2024.02-1-Linux-x86_64.sh
			bash Anaconda3-2024.02-1-Linux-x86_64.sh -b -p /home/$ME/anaconda3
			echo "PATH=$PATH:/home/kduncan/anaconda3/bin" >> /home/$ME/.profile
		fi
		#call the script install-aws-cli.sh
	#From chat gpt
		# Check if the file exists and is executable
		if [ -x "$script_path_one" ]; then
    		# File exists and is executable, so we can run it
    			"$script_path_one" 
		else
    		# File does not exist or is not executable
    			echo "Error: Script '$script_path_one' does not exist or is not executable."
    		# Handle the error accordingly
		fi

  		# Check if the file exists and is executable
		if [ -x "$script_path_two" ]; then
    		# File exists and is executable, so we can run it
    			"$script_path_two" 
		else
    		# File does not exist or is not executable
    			echo "Error: Script '$script_path_two' does not exist or is not executable."
    		# Handle the error accordingly
		fi
	
	else
		echo "apt is not installed at the specified location."
	fi
#Link to gitconfig files
# ln command from Kayleigh Duncan
# part of if statement from Chat gpt
	if [[ -e /home/$ME/.gitconfig ]]; then
		rm /home/$ME/.gitconfig
	fi
	
 	ln -s /home/$ME/dotfiles/.gitconfig /home/$ME/.gitconfig
 	
  	if [[ -e /home/$ME/.bashrc ]]; then
                rm /home/$ME/.bashrc

        fi
	 ln -s /home/$ME/dotfiles/.bashrc /home/$ME/.bashrc

	if [[ -e /home/$ME/.ssh/config ]]; then
                rm /home/$ME/.ssh/config

        fi
 
 	ln -s /home/$ME/dotfiles/sshfiles/config /home/$ME/.ssh/config

else
	echo "Script is not running as root, exiting..." 1>&2
	exit 1
fi
