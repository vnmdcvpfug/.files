#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# shell prompt
PS1='> '

# system aliases
alias nm0='/bin/systemctl disable --now NetworkManager.service && /bin/systemctl mask NetworkManager.service'
alias nm1='/bin/systemctl unmask NetworkManager.service && /bin/systemctl enable --now NetworkManager.service'
alias off='/bin/systemctl disable --now NetworkManager.service && /bin/systemctl mask NetworkManager.service && /bin/systemctl disable --now bluetooth.service && /bin/systemctl mask bluetooth.service && /bin/systemctl poweroff'
alias on='/bin/systemctl disable --now NetworkManager.service && /bin/systemctl mask NetworkManager.service && /bin/systemctl disable --now bluetooth.service && /bin/systemctl mask bluetooth.service && /bin/systemctl reboot'
alias x='startx'
alias xx="nm1 && bt1 && startx"
alias bt0='/bin/systemctl disable --now bluetooth.service && /bin/systemctl mask bluetooth.service'
bt1() {
  /bin/systemctl unmask bluetooth.service
  /bin/systemctl enable --now bluetooth.service
  sleep 0.5
  bluetoothctl connect $(cat $HOME/.files/device)
}
stop() {
  pids=$(pgrep -f "$1")
  if [ -z "$pids" ]; then
    echo "No process found for: $1"
    return 1
  fi
  echo "Found process(es):"
  ps -fp $pids
  read -p "Stop these? (y/N): " confirm
  [[ "$confirm" == "y" || -z "$confirm" ]] && kill $pids
}

# navigation aliases
alias grep='grep --color=auto'
alias ls='ls -a --color=auto'
cd() {
  builtin cd "$@" && ls -a
}

# pacman aliases
alias qqe='pacman -Qqe'
alias rns='sudo pacman -Rns'
alias s='sudo pacman -S'
alias sc='sudo pacman -Sc'
alias se='pacman -Ss'
alias swu='sudo pacman -Swu'
alias sy='sudo pacman -Sy'
alias syu='sudo pacman -Syu'

# package aliases
alias torb='gtk-launch start-tor-browser'
alias torc='curl https://check.torproject.org'
alias torr='/bin/systemctl restart tor.service'
alias tors='systemctl status tor'
