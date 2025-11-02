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
## Setup
- activate flatpak repositories in Store
## Fix Cosmic Files to work with network Shares
### SMB
If connections to smb servers cannot be established via the Files UI, the necessary package for interacting with Samba (SMB) shares, gvfs-smb, is likely not installed (Gnome). The GVFS (GNOME Virtual File System) backend handles connections to various remote file systems.
```bash
sudo dnf install gvfs-smb
```
### NFS
If connections to nfs servers cannot be established via the Files UI, the necessary package for interacting with NFS shares, gvfs-nfs, is likely not installed (Gnome). The GVFS (GNOME Virtual File System) backend handles connections to various remote file systems.
```bash
sudo dnf install gvfs-nfs
```
