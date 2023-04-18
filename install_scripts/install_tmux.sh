#!/bin/bash

# Check if tmux is installed
if ! command -v tmux >/dev/null 2>&1; then
  echo "Installing tmux"

  if [[ "$(uname)" == "Darwin" ]]; then
    brew install tmux
  elif [[ "$(uname)" == "Linux" ]]; then
    sudo apt-get update
    sudo apt-get install -y tmux
  else
    echo "Unsupported operating system. Exiting."
    exit 1
  fi
else
  echo "tmux is already installed."
fi
