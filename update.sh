#!/usr/bin/env bash

set -euo pipefail

echo "Updating dotfiles in home directory..."

git clone https://github.com/yujinyuz/dotfiles.git ~/.dotfiles

# Update Vim config
cd ~/.dotfiles

# Copy vimrc
echo "Copying vim configurations..."
cp vim/_vimrc ~/.vimrc
cp -r vim/vimconfigs ~/.vimconfigs

# Install vim plugins
echo "Installing Vundle..."
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "Installing vim plugins..."
vim +PluginInstall +qall

