#!/bin/bash
# Linux Mint Setup script 12/2021 with sudos
# $Author: passl $
# $Revision: 0.1 $

# how to use: clone repo and make bootstrap script executable:
#cd ~/Downloads
#git clone https://github.com/pschropp/linuxPcInstallation.git
#sudo chmod +x linux-mint_bootstrap.sh
# execute script
#sudo ./linux-mint_bootstrap.sh

########### essential ############
cd ~/Downloads

#sudo update-grub

echo "Updating and Upgrading"
sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y

echo “Updating firefox to latest by adding ppa”
sudo add-apt-repository ppa:mozillateam && sudo apt update && sudo apt install -y firefox

echo “Installing Keepass”
sudo add-apt-repository ppa:phoerious/keepassxc && sudo apt update && sudo apt install -y keepassxc

echo “Installing Veracrypt”
sudo add-apt-repository ppa:unit193/encryption && sudo apt update && sudo apt install -y veracrypt

echo “Installing FreeFileSync”
wget https://freefilesync.org/download/FreeFileSync_11.15_Linux.tar.gz && sudo tar -zxvf ~/Downloads/FreeFileSync_*_Linux.tar.gz
sudo ./Installation.run

echo “Installing VPNc for FritzVPN”
sudo apt install -y network-manager-vpnc-gnome

echo “Nextcloudsync”
sudo add-apt-repository ppa:nextcloud-devs/client && sudo apt update && sudo apt install -y nemo-nextcloud

echo “Installing SCX3405 printer”
wget https://ftp.hp.com/pub/softlib/software13/printers/SS/SL-M4580FX/uld_V1.00.39_01.17.tar.gz
tar -zxvf uld_V1.00.39_01.17.tar.gz
cd uld
sudo ./install.sh
cd ~/Downloads

echo “Installing SCX3405 scanner”
cd /usr/lib/x86_64-linux-gnu/sane && sudo ln -s /opt/smfp-common/scanner/lib/libsane-smfp.so.1.0.1 /usr/lib/x86_64-linux-gnu/sane/libsane-smfp.so.1
sudo apt install -y libusb-0.1-4
sudo printf “# Samsung SCX-3405W, network mode \n # tcp HOST_ADDR PORT \n tcp 192.168.179.30 9400”  >> /etc/sane.d/xerox_mfp.conf

echo “Installing screen and git”
sudo apt install -y screen && sudo apt install -y git

echo “Installing TLP to save power on laptops”
sudo apt install -y tlp

echo “Installing multimedia codecs”
sudo apt-get install -y ubuntu-restricted-extras #also includes Microsoft Fonts
sudo apt-get install -y mint-meta-codecs

echo “Installing Microsoft Fonts and Google Replacement Fonts”
sudo add-apt-repository multiverse sudo apt update && sudo apt install -y ttf-mscorefonts-installer
sudo apt install -y cabextract fontforge mkdir .fonts && wget http://plasmasturm.org/code/vistafonts-installer/vistafonts-installer chmod +x vistafonts-installer && ./vistafonts-installer
sudo fc-cache -f -v
sudo apt install -y fonts-crosextra-carlito fonts-crosextra-caladea && sudo fc-cache -f -v

#echo “Activating TRIM (SSDs only! uncomment if intalled on SSD)”
#sudo systemctl enable fstrim.timer && sudo systemctl start fstrim.timer

########### Anwendungssoftware ############
cd ~/Downloads
echo “Installing Teamviewer”
wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb && sudo apt install -y ./teamviewer_amd64.deb

echo “Thunderbird”
sudo add-apt-repository ppa:mozillateam && sudo apt update && sudo apt install -y thunderbird

########### to be configured ###############
#nextcloudsync
#firefox account
#FritzVPN
#FF Addons - ubock origin, privacy Badger, noScript, KeepassXC
#Firewall ufw

echo “Done”
#EOF
