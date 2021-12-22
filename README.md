# Installation script for Linux post-installation

put hardcopies of:

## Installing Linux Mint with Full Disk Encryption in Dual Boot

## Optional: git config 
so that scripts and files can be loaded from github

## Printer SCX3405
add printer (for all users) via CUPS online interface (http://localhost:631/admin) and choose driverless (turn on network printer and select printer).

## Scanner SCX3405 (all done in bootstrap script)
install additional usb driver (libusb-0.1-4)  <br/>
create sane link and add scanner ip and port (9400) to '/etc/sane.d/xerox_mfp.conf'

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
- if necessary, configure grub: 
  > sudo nano /etc/default/grub <br/>
  > sudo update-grub
- Firefox Account and Addons: uBlock origin, PrivacyBadger, NoScript, KeepassXC-Browser
- SSD ONLY!!: activate TRIM by executing this: 
  > sudo systemctl enable fstrim.timer && sudo systemctl start fstrim.timer
- NexcloudSync
- LibreOffice: To activate Ribbons ("Notebookbar") click "View" -> "User Interface.." and chosse toolbar layout
- Firewall UFW
