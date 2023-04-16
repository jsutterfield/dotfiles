#!/bin/bash

if command -v zsh >/dev/null 2>&1; then
  echo "Zsh is already installed."
else
  echo "Zsh not found, installing..."
  if [[ "$(uname)" == "Darwin" ]]; then
    # macOS
    if command -v brew >/dev/null 2>&1; then
      brew install zsh
    else
      echo "Homebrew not found. Please install Homebrew and try again."
      exit 1
    fi
  elif [[ "$(uname)" == "Linux" ]]; then
    # Ubuntu
    if command -v apt >/dev/null 2>&1; then
      sudo apt update
      sudo apt install -y zsh
    else
      echo "apt not found. Please install Zsh manually."
      exit 1
    fi
  else
    echo "Unsupported operating system. Please install Zsh manually."
    exit 1
  fi
fi

