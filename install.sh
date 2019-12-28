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
  ln -sfn "${file_loc}" "${symlink_dest}"
}

function symlink_dotfiles() {
  create_symlink "${__dir}/git/_gitconfig" "${HOME}/.gitconfig"
  create_symlink "${__dir}/git/_gitignoreglobal" "${HOME}/.gitignoreglobal"
  create_symlink "${__dir}/tmux/_tmux.conf" "${HOME}/.tmux.conf"
  create_symlink "${__dir}/vim/_vimrc" "${HOME}/.vimrc"
  create_symlink "${__dir}/vim/coc-settings.json" "${HOME}/.vim/coc-settings.json"
  create_symlink "${__dir}/zsh/_zshrc" "${HOME}/.zshrc"
  create_symlink "${__dir}/zsh/aliases.zsh" "${HOME}/.aliases.zsh"
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
