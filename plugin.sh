#!/bin/bash
# Author: https://github.com/Dominic-github
#

ARCHINSTALL="sudo pacman -S --noconfirm "
YAYINSTALL="yay -S --noconfirm "
GOINSTALL="go install "
NPMINSTALL="sudo npm install -g"

# Fnm - manager node version
$YAYINSTALL fnm

# Lazygit
$ARCHINSTALL go

# gopls
$GOINSTALL golang.org/x/tools/gopls@latest

# format shell script
$GOINSTALL mvdan.cc/sh/v3/cmd/shfmt@latest

# Lazygit
$ARCHINSTALL lazygit

# Copy paste 
$ARCHINSTALL xclip

# C, Cpp,
$ARCHINSTALL clang

# Prettier
$ARCHINSTALL prettier

# Sumeko lua
$ARCHINSTALL lua-language-server

# Stylua
$ARCHINSTALL stylua

# python pip
$ARCHINSTALL python-pip

# emmetls
$NPMINSTALL emmet-ls

# Html, Cssls, jsonls
$NPMINSTALL vscode-langservers-extracted

# Js, ts, jsx
$NPMINSTALL typescript typescript-language-server

# Python
$NPMINSTALL pyright

# Bash
$NPMINSTALL bash-language-server

# vuejs
$NPMINSTALL vls

# Black format python
$NPMINSTALL @fsouza/prettierd

# csharp-ls
# dotnet tool install --global csharp-ls

# sudo rm -rf /usr/lib/python3.11/EXTERNALLY-MANAGED

# null-ls black format bash file
pip install git+https://github.com/psf/black
## Add path ~/.local/bin

# Markdown format
pip install mdformat
