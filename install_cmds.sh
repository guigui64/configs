#!/bin/bash

# APT
sudo apt install git gnome-tweak-tool python3 python3-pip vim vlc virtualbox fd-find net-tools minidlna curl exuberant-ctags calibre xclip tree llvm libclang-dev jq tmux ffmpeg cmake

# PIP
pip3 install pipenv flake8 jedi black isort

# NODE
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs

# RUST
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install bat
cargo install ripgrep

# FZF
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Vim
vim -c 'CocInstall -sync coc-rust-analyzer coc-prettier coc-json coc-html | q'

# Font
echo "Get JetBrains Mono here: https://www.jetbrains.com/lp/mono/"
