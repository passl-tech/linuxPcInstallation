originally found by looking at `sudo dmesg

## Manually install Firmware
```bash
cd /lib/firmware/brcm
```

```bash
sudo wget https://github.com/winterheart/broadcom-bt-firmware/raw/master/brcm/BCM20702A1-0a5c-21e3.hcd
```

load the driver (or reboot)
```bash
sudo modprobe -r btusb
sudo modprobe btusb
```
