# Prevent laptop from sleeping when closing the lid
```sudo nano /etc/systemd/logind.conf```

Set `HandleLidSwitch=ignore` and `HandleLidSwitchDocked=ignore` (instead of the default `sleep`)

restart


# Switch off screen after x minutes
```sudo nano /etc/default/grub```

Change the following line to: ```GRUB_CMDLINE_LINUX="consoleblank=300"``` (for 300s)

```update-grub```
