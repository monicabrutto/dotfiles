#!/bin/bash
echo $SUDO_USER
ME=$SUDO_USER

if [[ -e /home/$ME/.vim.bundle ]]; then 
	echo "/home/$(ME)/.vim/bundle already exists"
else 
	mkdir -p /home/$ME/.vim/bundle

	# Clone Vundle repository
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

	# Create a backup of existing .vimrc file
	if [ -f /home/$ME/.vimrc ]; then
    	mv ~/.vimrc /home/$ME/.vimrc.backup
	fi

	echo "Vundle has been successfully installed"
	echo "Removed Vundle default vimrc"
	ln -s ~/dotfiles/vimrc /home/$ME/.vimrc
	echo "Replaced with repo vimrc"
	

	vim +PluginInstall +qall
       		
	echo "Installed plugin list in vim"
	

	mkdir -p /home/$ME/.vim/pack/tpope/start
	cd /home/$ME/.vim/pack/tpope/start
	git clone https://tpope.io/vim/fugitive.git
	vim -u NONE -c "helptags fugitive/doc" -c q	
	
fi
