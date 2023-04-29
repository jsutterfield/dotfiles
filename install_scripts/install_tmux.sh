#!/bin/bash

# Check if tmux is installed
if ! command -v tmux >/dev/null 2>&1; then
	echo "Installing tmux"

	if [[ "$(uname)" == "Darwin" ]]; then
		brew install tmux
		if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
			git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
		fi

	elif [[ "$(uname)" == "Linux" ]]; then
		sudo apt-get update
		sudo apt-get install -y tmux
		if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
			git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
		fi
	else
		echo "Unsupported operating system. Exiting."
		exit 1
	fi
else
	echo "tmux is already installed."
fi
