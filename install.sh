#!/usr/bin/env bash

set -e

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"


function clean_install() {
    echo -n "Would you like to have a clean install? [y/n] > "
    read clean_install
    if [ "$clean_install" == "y" ]; then
        make clean
    fi
}

function create_symlink() {
    local file_loc="$1"
    local symlink_dest="$2"
    
    ln -sfn "$file_loc" "$symlink_dest"
}

function symlink_dotfiles() {
    echo "Symlinking dotfiles..."
    local vimrc_path="$SCRIPTPATH/vim/.vimrc"
    local vimconfig_path="$SCRIPTPATH/vim/vimconfigs"

    create_symlink "$vimrc_path" "$HOME/.vimrc"
    create_symlink "$vimconfigs" "$HOME/.vimconfigs"
}

function main() {
    echo "Installing vim configuration files. This may take several minutes..."
    symlink_dotfiles
}

main