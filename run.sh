#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "you have no permission dummy"
  exit
fi

#-------BASIC-INSTALLATION------
echo -e "\e[93m----------------basic installation..."
echo -e "\e[1;30m"
apt install -y -qq htop build-essential git vim net-tools wpasupplicant psmisc acpi sudo ranger elinks cmus neofetch
/sbin/usermod -aG sudo spacebar
echo -e "\e[92m--------Done!"
echo -e "\e[93m----------------GUI installation..."
apt install -y -qq xorg mesa-utils xorg openbox obconf rofi xfonts-terminus lxappearance lemonbar xfce4-terminal firefox-esr telegram-desktop scrot
echo -e "\e[92m--------Done!"
#-------BUILDIN-GIT-STUFF-------
echo -e "\e[93m----------------Installing login manager..."
if ! [ -f /home/spacebar/ ];
	then cd /home/spacebar
	else cd ~
fi
mkdir GIT
cd GIT
git clone https://github.com/nullgemm/ly
apt -y -qq install build-essential libpam0g-dev libxcb-xkb-dev
cd ly
make github -s
make -s
make -s install

echo -e "\e[92m--------Done!"
echo -e "\e[93m----------------Installing composer..."
cd ../
git clone https://github.com/tryone144/compton
cd compton
apt -y -qq install libx11-dev libxcomposite-dev libxdamage-dev libxfixes-dev libxext-dev libxrender-dev libxrandr-dev libxinerama-dev pkg-config x11proto-dev x11-utils libpcre++-dev libconfig-dev libdrm-dev libgl-dev libdbus-1-dev asciidoc
make -s 
make -s install
cd ../
echo -e "\e[93m----------------Installing lemonbar..."
git clone https://github.com/drscream/lemonbar-xft
cd lemonbar-xft
apt -y -qq install libc6-dev libxcb-randr0-dev libxcb-xinerama0-dev libxcb1-dev libxft-dev libx11-xcb-dev libxkbcommon-x11-dev
make -s
make -s install
echo -e "\e[92m---------Done!"
#---i3-gaps_dependencies
#apt -y -qq install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf xutils-dev libtool automake libxcb-shape0-dev libxcb-xrm-dev

cd ../
git clone https://github.com/stark/siji 
cd siji 
bash install.sh

apt -y -qq remove libxcb-randr0-dev libxcb-xinerama0-dev libxcb1-dev libxft-dev libx11-xcb-dev libxkbcommon-x11-dev ascii libx11-dev libxcomposite-dev libxdamage-dev libxfixes-dev libxext-dev libxrender-dev libxrandr-dev libxinerama-dev x11proto-dev libpcre++-dev libconfig-dev libdrm-dev libgl-dev libdbus-1-dev asciidoc
systemctl enable ly.service 

reboot
