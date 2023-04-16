#!/bin/bash

# Check the current OS
os=$(uname)

# Get the default shell for the current user
if [ "$os" = "Darwin" ]; then
  # macOS
  default_shell=$(dscl . -read /Users/$USER UserShell | awk '{print $2}')
else
  # Linux
  default_shell=$(getent passwd $USER | awk -F: '{print $7}')
fi

# Check if the default shell is Zsh
if [[ $default_shell == *"/zsh" ]]; then
  echo "Default shell is already set to Zsh"
else
  echo "Setting default shell to Zsh"

  if [ "$os" = "Darwin" ]; then
    # macOS
    sudo dscl . -change /Users/$USER UserShell $default_shell /bin/zsh
  else
    # Linux
    sudo chsh -s /bin/zsh $USER
  fi
fi

