#!/bin/bash

set -euxo pipefail

INSTALL_PATH="${HOME}/.oh-my-zsh/custom/plugins"

mkdir -p "${INSTALL_PATH}"

SYNTAX_HIGHLIGHTING="${INSTALL_PATH}/zsh-syntax-highlighting"
if [ ! -d "${SYNTAX_HIGHLIGHTING}" ]; then
    echo "installing zsh-syntax-highlighting"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${SYNTAX_HIGHLIGHTING}"
else
    echo "zsh-syntax-highlighting already installed"
fi

AUTO_SUGGESTIONS="${INSTALL_PATH}/zsh-autosuggestions"
if [ ! -d "${AUTO_SUGGESTIONS}" ]; then
    echo "installing zsh-autosuggestions"
    git clone https://github.com/zsh-users/zsh-autosuggestions "${AUTO_SUGGESTIONS}"
else
    echo "zsh-autosuggestions already installed"
fi

