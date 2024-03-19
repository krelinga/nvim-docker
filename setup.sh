#! /usr/bin/bash

# Exit early on errors.
set -e

# Hint to debian tools that we are running in non-interactive mode.
export DEBIAN_FRONTEND=noninteractive

# Install neovim dependencies per https://github.com/neovim/neovim/blob/master/BUILD.md
apt-get update
apt-get install -y git ninja-build gettext cmake unzip curl build-essential

# Grab the source
git clone https://github.com/neovim/neovim
cd neovim

# Use the stable branch.
git checkout stable

# Compile
make CMAKE_BUILD_TYPE=RelWithDebInfo

# Install
make install
