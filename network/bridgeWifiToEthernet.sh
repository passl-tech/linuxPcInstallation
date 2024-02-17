#!/bin/bash

# Script to prepare the bridging of wifi to ethernet on a raspberry with piOS.
# inspred by: https://dennymichael.net/category/linux/raspberry/
# First execute script locally on Pi (via screen and keyboard) as sudoer - as ssh connection will be disconnected and wifi not automatically reconfigured.Then follow GUI steps to finalize.

## install NetworManager and deactivate dhcpcd
sudo apt update
sudo apt full-upgrade -y
sudo apt dist-upgrade -y
sudo apt install network-manager network-manager-gnome -y
sudo systemctl stop dhcpcd.service
sudo systemctl disable dhcpcd.service
sudo systemctl enable NetworkManager.service
sudo systemctl start NetworkManager.service
sudo reboot now

## configure connections using NetworkManager on GUI as described in readme.
