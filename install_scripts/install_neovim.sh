#!/bin/bash

NVIM_VERSION="v0.8.3"
INSTALL_DIR="$HOME/bin"

mkdir -p "${INSTALL_DIR}"

if [ -x "${INSTALL_DIR}/nvim" ]; then
    echo "nvim already installed"
    exit 0
fi

cd /tmp

if [[ "$(uname)" == "Darwin" ]]; then
    # MacOS
    echo "installing nvim for MacOS"
    curl -LO "https://github.com/neovim/neovim/releases/download/${NVIM_VERSION}/nvim-macos.tar.gz"
    tar -xzf nvim-macos.tar.gz
    rm nvim-macos.tar.gz
    mv nvim-macos/ "${INSTALL_DIR}/.nvim"
    ln -s /Users/jsutterfield/bin/.nvim/bin/nvim /Users/jsutterfield/bin/nvim
elif [[ "$(uname)" == "Linux" ]]; then
    # Ubuntu
    echo "installing nvim for Ubuntu"
    curl -LO "https://github.com/neovim/neovim/releases/download/${NVIM_VERSION}/nvim.appimage"
    chmod +x nvim.appimage
    mv nvim.appimage "${INSTALL_DIR}/nvim"
fi
