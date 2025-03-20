#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# shell prompt
PS1='> '

# system aliases
alias bat='cat /sys/class/power_supply/BAT1/capacity'
alias nmoff='sudo systemctl disable --now NetworkManager && sudo systemctl mask NetworkManager'
alias nmon='sudo systemctl unmask NetworkManager && sudo systemctl enable --now NetworkManager'
alias off='sudo systemctl disable --now NetworkManager && sudo systemctl mask NetworkManager && sudo systemctl disable --now bluetooth && sudo systemctl mask bluetooth && sudo systemctl poweroff'
alias on='sudo systemctl disable --now NetworkManager && sudo systemctl mask NetworkManager && sudo systemctl disable --now bluetooth && sudo systemctl mask bluetooth && sudo systemctl reboot'
alias btoff='sudo systemctl disable --now bluetooth && sudo systemctl mask bluetooth'
bton() {
  sudo systemctl unmask bluetooth
  sudo systemctl enable --now bluetooth
  sleep 0.5
  bluetoothctl connect $(sudo cat ~/.files/device)
}

# navigation aliases
alias grep='grep --color=auto'
alias ls='ls -a --color=auto'
cd() {
  builtin cd "$@" && ls -a
}

# pacman aliases
alias qq='pacman -Qq'
alias rns='sudo pacman -Rns'
alias s='sudo pacman -S'
alias sc='sudo pacman -Sc'
alias se='pacman -Ss'
alias syu='sudo pacman -Syu'

# package aliases
alias h='hyprland'
alias nvim='export NVIM_LISTEN_ADDRESS="/tmp/nvim-$$.sock" && nvim --listen "$NVIM_LISTEN_ADDRESS"'
alias ranger='ranger --choosedir=$HOME/.files/.rangerdir; LASTDIR=`cat $HOME/.files/.rangerdir`; cd "$LASTDIR"'

# git aliases
push() {
  git push https://vnmdcvpfug:$(sudo cat $HOME/.files/token)@github.com/vnmdcvpfug/$1.git
}

# exports
export EDITOR=nvim
export VISUAL=nvim
