#!/bin/bash

set -euxo pipefail

if [[ "$(uname)" == "Darwin" ]]; then
  if command -v brew >/dev/null 2>&1; then
    echo "Homebrew is already installed."
  else
    echo "Homebrew not found, installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
else
  echo "Not running on macOS. Skipping Homebrew installation."
fi

