#!/bin/bash
set -e
echo -e "\ndotfiles v0.1.1"
echo -e "Author: vnmdcvpfug"
echo -e "Source: https://github.com/vnmdcvpfug/.files\n"
echo -e "Welcome to the installation script."
echo -e "It will install the dotfiles and configure the system."
echo -e "Please note that this script can delete files that are important to you. Use with caution."
echo -en "This script is intended for a freshly installed Arch Linux system. Proceed? [y/N]"; read choice_proceed

if [ "$choice_proceed" ] || [ "y" ] || [ "Y" ] || [ "yes" ] || [ "Yes" ] || [ "YES" ]; then
  # Start
  cd
  
  # Install scripts
  echo -e "\nInstalling the scripts..."
  sudo ln -sf ~/.files/scripts/ai /etc/bin/ai
  sudo ln -sf ~/.files/scripts/batteryctl.service /etc/systemd/system/batteryctl.service
  sudo ln -sf ~/.files/scripts/brightnessctl /usr/bin/brightnessctl
  sudo ln -sf ~/.files/scripts/menu /usr/bin/menu
  sudo ln -sf ~/.files/scripts/music /usr/bin/music
  sudo ln -sf ~/.files/scripts/switchmode /usr/bin/switchmode
  sudo cp -r ~/files/scripts/sudoers /etc/sudoers
  sudo ln -sf ~/.files/scripts/switchwallpaper /usr/bin/switchwallpaper

  # Configure the system
  echo -e "\nConfiguring the system..."
  sudo systemctl enable --now batteryctl.service
  git config --global init.defaultBranch main

  # Make symbolic links
  echo -e "\nCreating symbolic links..."
  ln -sf ~/.files/.config/hypr ~/.config/hypr
  ln -sf ~/.files/.config/inori ~/.config/inori
  ln -sf ~/.files/.config/mpd ~/.config/mpd
  ln -sf ~/.files/.config/nvim ~/.config/nvim
  ln -sf ~/.files/.config/tmux ~/.config/tmux
  ln -sf ~/.files/.config/wezterm ~/.config/wezterm
  ln -sf ~/.files/.config/zathura ~/.config/zathura
  ln -sf ~/.files/.bashrc ~/.bashrc

  # Install packages
  echo -e "\nInstalling the packages..."
  sudo pacman -S bluez bluez-utils chromium hyprland hyprpaper mpv mpd noto-fonts noto-fonts-cjk noto-fonts-emoji neovim ripgrep tmux tor torsocks wl-clipboard xdg-desktop-portal-gtk xdg-desktop-portal-hyprland wezterm zathura zathura-pdf-mupdf
  mkdir -p ~/opt
  cd ~/opt
  git clone https://github.com/eshrh/inori
  cd ~/opt/inori
  sudo pacman -S rust
  cargo install inori
  sudo pacman -Rns rust
  sudo mv ~/.cargo/bin/inori /usr/bin/inori
  rm -fr ~/.cargo

  # End
  echo -en "\nThe installation is complete. Would you like to start Hyprland? [Y/n]"; read choice_hyprland
else
  exit 0
fi

if [ "$choice_hyprland" ] || [ "y" ] || [ "Y" ] || [ "yes" ] || [ "Yes" ] || [ "YES" ] || [ "" ]; then
  cd
  hyprland
else
  exit
fi
