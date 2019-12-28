killport() {
  kill -9 $(lsof -t -i:${1}) > /dev/null 2>&1
  if [[ $? -ne "0" ]]; then
    echo "No processes running on port ${1}"
  fi
}

alias ping1="ping sgp-1.valve.net"
alias pingml="ping 222.127.12.131"
alias youtubedl-video="youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4' --external-downloader aria2c"
alias dlmp3="cd $HOME/Music; youtube-dl -o '%(title)s.%(ext)s' --extract-audio --audio-format mp3 --external-downloader aria2c"
alias getip="curl ipinfo.io/ip"
alias localip="ifconfig|grep 'inet 192'|cut -d' ' -f2"
alias untar="tar -zxvf"
alias mkpass="openssl rand -base64 20"
alias dirsize="du -sh"
alias subdirsize="du -h -d 1 | sort -hr" # get all folder sizes sorted
alias delremote="echo git push --delete <remote_name> <branch_name>"
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias batt="ioreg -rc AppleSmartBattery"
alias pm="python manage.py"
alias whatusesdrive="sudo lsof +D"
alias lnvm=". $NVM_DIR/nvm.sh && . $NVM_DIR/bash_completion" # Load nvm and bash_completions
alias j="z"
alias diff="diff-so-fancy"
alias cat="bat"
alias ls="exa"
alias l="exa -lahF"
alias tree="exa --tree --level=3"
alias ll="exa -lahF --git"
alias vim="nvim"
alias vi="nvim"
alias t="tmux"
alias tn="tmux new -s" # <session_name>
alias ta="tmux a -t" # <session_name>
alias tkall="tmux kill-session -a"
