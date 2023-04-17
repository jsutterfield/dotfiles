#!/bin/bash

set -euxo pipefail

$INSTALL_PATH="${HOME}/.zsh/pure"

if [ -d "${INSTALL_PATH}" ]; then
    echo "pure already installed"
    exit 0
fi

mkdir -p "$HOME/.zsh"
git clone https://github.com/sindresorhus/pure.git "${INSTALL_PATH}"
