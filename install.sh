#!/bin/bash
set -e
echo -e "\ndotfiles v0.4.0"
echo -e "Author: vnmdcvpfug"
echo -e "Source: https://github.com/vnmdcvpfug/.files\n"
echo -e "Welcome to the installation script."
echo -e "It will install the dotfiles and configure the system."
echo -e "Please note that this script can delete files that are important to you. Use with caution."
echo -en "This script is intended for a freshly installed Arch Linux system. Proceed? [y/N] "; read choice_proceed

if [ "$choice_proceed" ] || [ "y" ] || [ "Y" ] || [ "yes" ] || [ "Yes" ] || [ "YES" ]; then
  # Start
  cd
  
  # Install scripts
  echo -e "\nInstalling the scripts..."
  sudo mkdir -p /usr/bin
  sudo ln -sf ~/.files/bin/batteryctl.service /etc/systemd/system/batteryctl.service
  sudo ln -sf ~/.files/bin/brightnessctl /usr/bin/brightnessctl
  sudo ln -sf ~/.files/bin/ /usr/bin/brightnessctl
  sudo ln -sf ~/.files/menu /usr/bin/menu
  sudo ln -sf ~/.files/statusbar /usr/bin/statusbar
  sudo ln -sf ~/.files/bin/switchmode /usr/bin/switchmode
  sudo cp -r ~/.files/bin/sudoers /etc/sudoers
  sudo ln -sf ~/.files/viewbat /usr/bin/viewbat
  sudo ln -sf ~/.files/viewbl /usr/bin/viewbl
  sudo ln -sf ~/.files/viewbt /usr/bin/viewbt
  sudo ln -sf ~/.files/viewcpu /usr/bin/viewcpu
  sudo ln -sf ~/.files/viewdate /usr/bin/viewdate
  sudo ln -sf ~/.files/viewnet /usr/bin/viewnet
  sudo ln -sf ~/.files/viewnm /usr/bin/viewnm
  sudo ln -sf ~/.files/viewram /usr/bin/viewram
  sudo ln -sf ~/.files/viewtemp /usr/bin/viewtemp
  sudo ln -sf ~/.files/viewtime /usr/bin/viewtime
  sudo ln -sf ~/.files/viewvol /usr/bin/viewvol

  # Configure the system
  echo -e "\nConfiguring the system..."
  sudo systemctl enable --now batteryctl.service
  git config --global init.defaultBranch main

  # Make symbolic links
  echo -e "\nCreating symbolic links..."
  ln -sf ~/.files/.config/i3 ~/.config/i3
  ln -sf ~/.files/.config/nvim ~/.config/nvim
  ln -sf ~/.files/.config/ranger ~/.config/ranger
  ln -sf ~/.files/.config/wezterm ~/.config/wezterm
  ln -sf ~/.files/.config/zathura ~/.config/zathura
  ln -sf ~/.files/.bashrc ~/.bashrc
  ln -sf ~/.files/.xinitrc ~/.xinitrc

  # Install packages
  echo -e "\nInstalling the packages..."
  sudo pacman -S bluez bluez-utils chromium i3wm noto-fonts noto-fonts-cjk noto-fonts-emoji neovim ranger ripgrep xdg-desktop-portal-gtk wezterm zathura zathura-pdf-mupdf
  cd /usr/share/fonts
  curl -O https://github.com/google/material-design-icons/blob/master/variablefont/MaterialSymbolsSharp%5BFILL%2CGRAD%2Copsz%2Cwght%5D.ttf
  cd ~

  # End
  echo -en "\nThe installation is complete. Would you like to start i3? [Y/n] "; read choice_i3
else
  exit 0
fi

if [ "$choice_i3" ] || [ "y" ] || [ "Y" ] || [ "yes" ] || [ "Yes" ] || [ "YES" ] || [ "" ]; then
  cd
  startx
else
  exit
fi
