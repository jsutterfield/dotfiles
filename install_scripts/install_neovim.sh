#!/bin/bash

NVIM_VERSION="0.8.3"
INSTALL_DIR="$HOME/bin/nvim"

mkdir -p "${INSTALL_DIR}"

if [ ! -d "${INSTALL_DIR}/bin/nvim" ]; then
  if [[ "$(uname)" == "Darwin" ]]; then
    # MacOS
    curl -LO "https://github.com/neovim/neovim/releases/download/v${NVIM_VERSION}/nvim-macos.tar.gz"
    tar -xzf nvim-macos.tar.gz
    rm nvim-macos.tar.gz
    mv nvim-macos/* "${INSTALL_DIR}"
  elif [[ "$(uname)" == "Linux" ]]; then
    # Ubuntu
    curl -LO "https://github.com/neovim/neovim/releases/download/v${NVIM_VERSION}/nvim-linux64.tar.gz"
    tar -xzf nvim-linux64.tar.gz
    rm nvim-linux64.tar.gz
    mv nvim-linux64/* "${INSTALL_DIR}"
  fi
fi

