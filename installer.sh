#!/bin/sh
# Created by MrBlackX/TheMasterCH
# Actual maintainer: 0n1cOn3
# Version 0.6

# Install dependencies
apk add figlet git curl python2 python3 tar wget bash -y > /dev/null

# Get colors ready
red='\e[1;31m'
green='\e[1;32m'
blue='\e[1;34m'
purple='\e[1;35m'

echo -e "$red" "figlet Termux-Wifi"
echo -e "$blue" "by MrBlackx/TheMasterCH"
echo -e "$purple" "modified by 0n1cOn3"

prepare_environment() {
  # No need to set up storage on iSH
  # No need to install Termux-specific packages like git, curl, python2, python3
  # iSH already has wget and bash
  # No need to clear the screen on iSH
}

prepare_environment_2() {
  apk add figlet wget proot tar curl -y
  # Use new repository for Ubuntu setup
  wget https://raw.githubusercontent.com/tuanpham-dev/termux-ubuntu/master/ubuntu.sh
  chmod +x ubuntu.sh
  bash ubuntu.sh
  # No need to clear the screen on iSH
}

install_environment() {
  echo -e "$purple" "==============================================================="
  echo " "
  echo -e "$blue" && figlet "Installing requirements..."
  echo " "
  echo -e "$purple" "==============================================================="
  chmod +rwx ubuntu.sh
  ./ubuntu.sh
  # No need to clear the screen on iSH
  echo -e "$purple" "Successfully installed!"
  sleep 3
  ./start-ubuntu.sh
  apk update
  apk upgrade -y
  apk add git net-tools wireless-tools aircrack-ng xterm dhcp hostapd iptables ettercap dsniff reaver bully ssltrip unzip expect lighttpd hashcat pixiewps curl python3 php7 -y
  # DHCP server installation command might be different, ensure to verify
  # dhcpd -y
  git clone https://www.github.com/FluxionNetwork/fluxion.git
  cd fluxion && chmod +rwx *
  ./fluxion.sh
  echo -e "$red" "by MrBlackX/TheMasterCH"
  echo -e "$purple" "modified by 0n1cOn3"
  echo -e "$green" "Successfully installed!"
}

prepare_environment
prepare_environment_2
install_environment
