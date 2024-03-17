#!/bin/bash
if [ -f ~/.gitconfig ]; then
    echo "Existing .gitconfig file found. Do you want to overwrite it? (y/n)"
    read -r response
    if [[ $response =~ ^[Yy]$ ]]; then
        rm ~/.gitconfig

	echo "Setting up .gitconfig file"
	
	# Set up .gitconfig file
	cat > ~/.gitconfig <<EOF
	[user]
    		name = "Monica Brutto"
    		email = "brutto.2@wright.edu"
	[color]
    		ui = auto
	[core]
    		editor = vim
	[help]
    		autocorrect = 20
EOF

	echo "Git configuration is set up!"
   else
        echo "Aborted. .gitconfig file was not modified."
        exit 1
    fi
fi
