#!/bin/bash
# Linux Mint Setup script 12/2021
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

echo "Updating and Upgrading"
sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y

echo "adding PPAs"
sudo add-apt-repository -y ppa:mozillateam #Firefox and Thunderbird
sudo add-apt-repository -y ppa:phoerious/keepassxc #KeepassXC
sudo add-apt-repository -y ppa:unit193/encryption #Veracrypt
sudo add-apt-repository -y ppa:nextcloud-devs/client #NextcloudSync
sudo add-apt-repository -y multiverse #for Microsoft core fonts and others
sudo apt update

echo “Updating firefox to latest by adding Mozilla PPA (PPA added above)”
sudo apt install -y firefox

echo “Installing Keepass”
sudo apt install -y keepassxc

echo “Installing Veracrypt”
sudo apt install -y veracrypt

echo “Installing FreeFileSync”
wget https://freefilesync.org/download/FreeFileSync_11.15_Linux.tar.gz && sudo tar -zxvf ~/Downloads/FreeFileSync_*_Linux.tar.gz
sudo ./FreeFileSync_*_Install.run
sudo rm -r FreeFileSync_*_Install.run FreeFileSync_*_Linux.tar.gz

echo “Installing VPNc for FritzVPN”
sudo apt install -y network-manager-vpnc-gnome

echo “Nextcloudsync”
sudo apt install -y nemo-nextcloud

echo “Installing SCX3405 printer driver”
# if adding via CUPS online interface (http://localhost:631/admin) and choosing driverless, no driver necessary. 
# Printer needs to be added there manually, however. Valid for all users.
#wget https://ftp.hp.com/pub/softlib/software13/printers/SS/SL-M4580FX/uld_V1.00.39_01.17.tar.gz
#tar -zxvf uld_V1.00.39_01.17.tar.gz
#cd uld && sudo ./install.sh
#cd ~/Downloads
#sudo rm -r uld_V1.00.39_01.17.tar.gz uld

echo “Configuring SCX3405 scanner”
sudo apt install -y libusb-0.1-4
cd /usr/lib/x86_64-linux-gnu/sane && sudo ln -s /opt/smfp-common/scanner/lib/libsane-smfp.so.1.0.1 /usr/lib/x86_64-linux-gnu/sane/libsane-smfp.so.1
sudo printf “# Samsung SCX-3405W, network mode \n # tcp HOST_ADDR PORT \n tcp 192.168.179.30 9400”  >> /etc/sane.d/xerox_mfp.conf

echo “Installing screen and git”
sudo apt install -y screen && sudo apt install -y git

echo “Installing TLP to save power on laptops”
sudo apt install -y tlp

echo “Installing multimedia codecs”
sudo apt-get install -y ubuntu-restricted-extras #also includes Microsoft Fonts
sudo apt-get install -y mint-meta-codecs

echo “Installing Microsoft Fonts and Google Replacement Fonts”
# Install truetype core fonts
sudo apt install -y ttf-mscorefonts-installer
# Install cleartype fonts (mainly Calibri) and make them available for all users by copying to /usr/share
sudo apt install -y cabextract fontforge mkdir .fonts && wget http://plasmasturm.org/code/vistafonts-installer/vistafonts-installer chmod +x vistafonts-installer && ./vistafonts-installer
sudo cp -R ~/.fonts /usr/share/fonts/truetype/microsoft
sudo rm -r vistafonts-installer
# Install google replacements for Calibri and Cambria
sudo apt install -y fonts-crosextra-carlito fonts-crosextra-caladea && sudo fc-cache -f -v

########### Anwendungssoftware ############
cd ~/Downloads
echo “Installing Teamviewer”
wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb && sudo apt install -y ./teamviewer_amd64.deb
sudo rm -r teamviewer_amd64.deb

echo “Thunderbird”
sudo apt install -y thunderbird

echo "########### to be configured ###############"
echo "-if necessary, configure grub: sudo nano /etc/default/grub AND sudo update-grub"
echo "-Firefox Account"
echo "-Firefox Addons: uBlock origin, PrivacyBadger, NoScript, KeepassXC-Browser"
echo "-add printer: via CUPS online interface (http://localhost:631/admin), choose driverless"
echo "-SSD ONLY!!: activate TRIM by executing this: sudo systemctl enable fstrim.timer && sudo systemctl start fstrim.timer"
echo "-NexcloudSync"
echo "-FritzVPN"
echo "-Firewall UFW"

echo "####Done####"
#EOF
