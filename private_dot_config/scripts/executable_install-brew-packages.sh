#!/bin/bash
# Install Homebrew if not already installed
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# Install formulae
xargs brew install < ~/.brew-package-list
# Install casks
xargs brew install --cask < ~/.brew-package-list

