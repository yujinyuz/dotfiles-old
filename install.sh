#!/usr/bin/env bash

set -e

set -o errexit
set -o pipefail
set -o nounset
# set -o xtrace

# Magic vars
__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
__file="${__dir}/$(basename "${BASH_SOURCE[0]}")"
__base="$(basename ${__file} .sh)"
__root="$(cd "$(dirname "${__dir}")" && pwd)"

arg1="${1:-}"


function create_symlink() {
    local file_loc="$1"
    local symlink_dest="$2"

    echo "ln -sfn ${file_loc} ${symlink_dest}"
    ln -sfn "$file_loc" "$symlink_dest"
}

function symlink_dotfiles() {
    create_symlink "${__dir}/vim/.vimrc" "${HOME}/.vimrc"
    create_symlink "${__dir}/vim/vimconfigs" "${HOME}/.vimconfigs"

    create_symlink "${__dir}/zsh/.zshrc" "${HOME}/.zshrc"
    create_symlink "${__dir}/zsh/yujinyuz.zsh-theme" "${ZSH}/custom/themes/yujinyuz.zsh-theme"

    create_symlink "${__dir}/ungrouped/.bash_aliases" "${HOME}/.bash_aliases"
}

function main() {
    # Currently just symlink since I'm not yet uploading it
    echo -n "Just symlink? [y/n] > "
    read is_symlink

    if [ "${is_symlink}" == "y" ]; then
        echo "Just doing some symlinks for now . . ."
        symlink_dotfiles
    fi
}

main