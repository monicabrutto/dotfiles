#!/bin/bash
# get username that called script
echo $SUDO_USER
ME=$SUDO_USER
script_path="/home/ubuntu/dotfiles/install-aws-cli.sh"

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

		# Check if the file exists and is executable
		if [ -x "$script_path" ]; then
    		# File exists and is executable, so we can run it
    			"$script_path" 
		else
    		# File does not exist or is not executable
    			echo "Error: Script '$script_path' does not exist or is not executable."
    		# Handle the error accordingly
		fi
<<<<<<< HEAD
  
  		./install-aws-cli.sh 
		#ln to .gitconfig 
		if [[ -f .gitconfig ]]; then
			ln -s ~/.gitconfig /dotfiles/.gitconfig
		else 
			ln -s ~/.gitconfig  .gitconfig
		fi 	  


		#ln to .gitconfig
                if [[ -f .bashrc ]]; then
                        echo ".bashrc is already in this directory"
                else
                        ln -s ~/.bashrc  .bashrc
                fi	
=======
>>>>>>> ce40cebaa95eaf36ad9284e42da4c57fed88a0e8


		#ln to .gitconfig
                if [[ -f ~/.ssh ]]; then
                        echo ".ssh is already in this directory"
                else
                        cp -r ~/.ssh .ssh
			if [[ -f ~/.ssh/authorized_keys ]]; then
				echo "already linked" 
			else 
				ln -s ~/.ssh/authorized_keys .ssh/authorized_keys
			
			fi
                fi
	
	else
		echo "apt is not installed at the specified location."
	fi
#Link to gitconfig files
 ln -s /home/$ME/dotfiles/gitfiles/.gitconfig /home/$ME/.gitconfig
 
 ln -s /home/$ME/dotfiles/bashrc /home/$ME/.bashrc
 ln -s /home/$ME/dotfiles/sshfiles/config /home/$ME/.ssh/config

else
	echo "Script is not running as root, exiting..." 1>&2
	exit 1
fi
