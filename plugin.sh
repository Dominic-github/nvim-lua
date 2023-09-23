#!/bin/bash
# Author: https://github.com/Dominic-github
#

ARCHINSTALL="sudo pacman -S "
GOINSTALL="go install "
NPMINSTALL="sudo npm install -g"


# Lazygit
$ARCHINSTALL go

# gopls
$GOINSTALL golang.org/x/tools/gopls@latest

# format shell script
$GOINSTALL mvdan.cc/sh/v3/cmd/shfmt@latest

# Lazygit
$ARCHINSTALL lazygit

# C, Cpp,
$ARCHINSTALL clang

# Prettier
$ARCHINSTALL prettier

# Sumeko lua
$ARCHINSTALL lua-language-server

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

# null-ls black format bash file
pip install git+https://github.com/psf/black
## Add path ~/.local/bin

# Markdown format
pip install mdformat
