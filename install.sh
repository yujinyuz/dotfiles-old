#!/usr/bin/env bash

set -euo pipefail

echo "Installing vim configuration files. This may take several minutes..."
echo -n "Would you like to have a clean install? [y/n] > "

read clean_install

if [ "$clean_install" == "y" ]; then
  make clean
fi

# Copy vimrc
echo "Copying vim configurations..."
cp vim/_vimrc ~/.vimrc
cp -r vim/vimconfigs ~/.vimconfigs

# Check if YouCompleteMe folder exists.
# If it does not, it means we are on a fresh installation.

YCM_DIR="$HOME/.vim/bundle/YouCompleteMe"
CLONE_YCM="git clone https://github.com/Valloric/YouCompleteMe "${YCM_DIR}" --depth 1"
UPDATE_MODULES="git submodule update --init --recursive"
COMPILE_YCM="python2 install.py"
if [ ! -d "$YCM_DIR" ]; then
    # Install YouCompleteMe separately
    echo "Installing YouCompleteMe"
    $CLONE_YCM

    echo "Updating submodules recursively..."
    cd "$YCM_DIR"
    $UPDATE_MODULES
    echo "Compiling YouCompleteMe source files..."
    $COMPILE_YCM
fi

# Install solarize colorscheme first to prevent errors
# when installing vim plugins
VIM_COLORS_DIR="$HOME/.vim/bundle/vim-colors-solarized"
CLONE_VIM_COLORS="git clone https://github.com/altercation/vim-colors-solarized "${VIM_COLORS_DIR}" --depth 1"
MOVE_VIM_COLORS="cp $VIM_COLORS_DIR/colors/solarized.vim $HOME/.vim/colors/"

mkdir -p "$HOME/.vim/colors/"

if [ ! -d "$VIM_COLORS_DIR" ]; then
    echo "Installing solarized colorscheme..."
    $CLONE_VIM_COLORS
    $MOVE_VIM_COLORS
fi

cd ~/.dotfiles

# Install vim plugins
CLONE_VUNDLE="git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim --depth 1"
INSTALL_VIM_PLUGINS="vim +PluginInstall +qall"
echo "Installing Vundle..."
$CLONE_VUNDLE
echo "Installing vim plugins..."
$INSTALL_VIM_PLUGINS

echo "Successfully installed vim configuration files. Enjoy!"
