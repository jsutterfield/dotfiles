#!/bin/bash

set -euxo pipefail

# Function to install packages on Ubuntu
install_on_ubuntu() {
  echo "install these programs manually, or update the script to make it work better: fzf ripgrep fd-find broot tldr bat"
}

# Function to install packages on MacOS
install_on_mac() {
  brew update
  brew install fzf ripgrep fd broot tldr bat
}

# Detect the operating system
os=$(uname)

# Install packages based on the detected operating system
if [ "$os" = "Linux" ]; then
  echo "Installing packages on Ubuntu..."
  install_on_ubuntu
elif [ "$os" = "Darwin" ]; then
  echo "Installing packages on MacOS..."
  install_on_mac
else
  echo "Unsupported operating system. This script only supports Ubuntu and MacOS."
fi

