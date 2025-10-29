# All Spins
## KDEConnect: Firewall needs to be opened for kdeconnect: 
sudo firewall-cmd --permanent --zone=public --add-service=kdeconnect
sudo firewall-cmd --reload

## Veracrypt: missing compatibility packages
This error, "veracrypt: error while loading shared libraries: libfuse.so.2: cannot open shared object file: No such file or directory," indicates that VeraCrypt cannot find the required libfuse.so.2 library on your system. This library is part of the FUSE (Filesystem in Userspace) package, which VeraCrypt needs to mount encrypted volumes.

Solution: Install the FUSE 2 Compatibility Library
```bash
sudo dnf install fuse-libs
# OR sometimes an older version is needed or has a different name
#sudo dnf install libfuse2
```

This usually happens on modern Linux distributions that may have switched to FUSE 3 (using libfuse3.so.3) and no longer include the older FUSE 2 library (libfuse.so.2) by default, even though VeraCrypt still depends on it.

# Cosmic Spin
- activate flatpak repositories in Store
