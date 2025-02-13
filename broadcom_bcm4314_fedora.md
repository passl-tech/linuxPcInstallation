In Fedora the default driver allows to connect to wifi but no internet connection possible.
Thus the following steps are necessary:

## Enable rpmfusion
```
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

## Install Drivers
```
sudo dnf install kmod-wl akmods akmod-wl
sudo reboot
```
