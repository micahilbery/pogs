#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

# Your code goes here.
brew install -y atuin
brew install -y bat
brew install -y eza
brew install -y fish
brew install -y go
brew install -y rustup
brew install -y tailscale
brew install -y tldr
brew install -y thefuck
brew install -y zoxide
