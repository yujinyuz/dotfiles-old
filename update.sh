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

# Check if YouCompleteMe folder exists.
# If it does not, it means we are on a fresh installation.

YCM_DIR = "~/.vim/bundle/YouCompleteMe"
if [ ! -d "$YCM_DIR" ]; then
    # Install YouCompleteMe separately
    git clone https://github.com/Valloric/YouCompleteMe "$YCM_DIR"
    cd ~/.vim/bundle/YouCompleteMe

    echo "Updating submodules recursively..."
    git submodule update --init --recursive
fi

# Install solarize colorscheme first to prevent errors
# when installing vim plugins
VIM_COLORS_DIR = "~/.vim/bundle/vim-colors-solarized"

if [ ! -d "$VIM_COLORS_DIR" ]; then
    echo "Installing solarized colorscheme..."
    git clone https://github.com/altercation/vim-colors-solarized "$VIM_COLORS_DIR"
    mv "$VIM_COLORS_DIR/colors/solarized.vim" ~/.vim/colors/
fi

cd ~/.dotfiles

# Install vim plugins
echo "Installing Vundle..."
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "Installing vim plugins..."
vim +PluginInstall +qall

