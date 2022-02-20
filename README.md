# Installation script for Linux post-installation

## Installing Linux Mint with Full Disk Encryption in Dual Boot
Source: https://echo-bravo-fox.medium.com/linux-and-windows-encrypted-in-dual-boot-12329821367c <br/>
Linux Mint 20 and Windows 10 in dual boot and both the OSs encrypted. <br/>
Requirements:
- Windows installed.
- Unallocated space in your disk

### Linux
1) Insert the USB key and boot Linux.
2) Start the installer and proceed until you have to select the installation type, choose "Something else".
3) Select the unallocated space, click on the + button and create a partition for the kernels: "Primary", "EXT4 journaling file system", "/boot". This partition is not encrypted. With a size of 550MB it will hold 4-5 kernels, can be bigger.
4) Click + to create the encrypted partition, that will hold the OS, in the empty space and set up the password: "Primary", "physical volume for encryption", password.
5) You will find the new encrypted partition at the top of the list, select it, click on the Change button and mount it: "EXT4 journaling file system", Mount Point "/"
6) Click on Install Now and proceed with the installation.
7) If you have Secure Boot enabled you will be asked to select an other password that you’ll need to insert after the reboot. Reboot, select Install MOK, insert the last password and proceed with the log in. If you don’t have Secure Boot enabled simply reboot.
8) Now you have Linux encrypted.

### Optional: Windows
Warning: avoid Hibernation to not break the dual boot.
1) Open Veracrypt and select "System", "Encrypt System Partition/Drive"
2) Select "Normal"
3) Select "Encrypt the Windows System Partition"
4) Select "Multi-Boot". If not displayed, follow https://medium.com/@lankycyril/using-veracrypt-with-a-uefi-dual-boot-setup-27d1eacbf36b
5) Select the Algorithm: keep AES (default)
6) Create rescue file
7) ...

## Optional: Setup and configure git and credential to use with github)
so that scripts and files can be loaded from github
```
sudo apt install git
git config --global user.name "YOUR NAME"
git config --global user.email "YOUR EMAIL"
git config --global credential.helper cache
```
if necessary, download the latest .deb package, and run the following:
```
sudo dpkg -i <path-to-package>
git-credential-manager-core configure
```
## Printer SCX3405
add printer (for all users) via CUPS online interface (http://localhost:631/admin) and choose driverless (turn on network printer and select printer). For printer URI choose ipp://192.168.17x.xx (put real IP), not mDNS or implicticlass... or whatever. Activate SLP at Port 9100 to make printer discoverable for smartphone printing apps/services.

## Scanner SCX3405 (all done in bootstrap script)
install additional usb driver (libusb-0.1-4) <br/>
create sane link and add scanner ip and port (9400) to `/etc/sane.d/xerox_mfp.conf`

## FritzVPN
(https://avm.de/service/vpn/tipps-tricks/vpn-verbindung-zur-fritzbox-unter-linux-einrichten/)  <br/>
Klicken Sie im Menü "Einstellungen" auf "Netzwerk", dann im Abschnitt "VPN" auf das Pluszeichen. Das Fenster "VPN hinzufügen" wird geöffnet. <br/>
Wählen Sie im Fenster "VPN hinzufügen" den Eintrag "Cisco-kompatibler VPN-Client (vpnc)" aus. <br/>
Tragen Sie im Eingabefeld "Name" einen beliebigen Namen (FRITZ!Box-VPN) ein. <br/>
Tragen Sie im Eingabefeld "Gateway" den MyFRITZ!-Domainnamen der FRITZ!Box (pi80ewgfi72d2os42.myfritz.net) ein. <br/>
Tragen Sie im Eingabefeld "Benutzername" den Benutzernamen des FRITZ!Box-Benutzers (Max Mustermann) ein. <br/>
Klicken Sie auf das Symbol im Eingabefeld "Benutzerpasswort", wählen Sie den Option "Passwort nur für diesen Benutzer speichern" aus und tragen Sie dann das Kennwort des FRITZ!Box-Benutzers ein. Hinweis:Bei einigen Ubuntu-Versionen muss stattdessen die Option "Passwort für alle Benutzer speichern" aktiviert werden. <br/>
Tragen Sie im Eingabefeld "Gruppenname" den Benutzernamen des FRITZ!Box-Benutzers (Max Mustermann) ein. <br/>
Klicken Sie auf das Symbol im Eingabefeld "Gruppenpasswort", wählen Sie den Eintrag "Passwort nur für diesen Benutzer speichern" aus und tragen Sie dann das "Shared Secret" des FRITZ!Box-Benutzers ein. Das "Shared Secret" wird in den VPN-Einstellungen des Benutzers im Abschnitt "iPhone, iPad oder iPod Touch" angezeigt. <br/>
Klicken Sie auf die Schaltfläche "Hinzufügen", um die Einrichtung abzuschließen. <br/>
Klicken Sie bei der VPN-Verbindung auf den An/Aus-Schalter, um die Verbindung herzustellen.

## Additional Configurations
### General
- if necessary, configure grub: 
  > sudo nano /etc/default/grub <br/>
  > sudo update-grub
- SSD ONLY!!: activate TRIM by executing this: 
  > sudo systemctl enable fstrim.timer && sudo systemctl start fstrim.timer
- Firewall UFW

### Per User
- Firefox Account and Addons: uBlock origin, PrivacyBadger, NoScript, KeepassXC-Browser
- NexcloudSync
- LibreOffice: To activate Ribbons ("Notebookbar") click "View" -> "User Interface.." and chosse toolbar layout
- mount FritzNAS via filemanager: a) via sidebar b) via smb://fritz.box
