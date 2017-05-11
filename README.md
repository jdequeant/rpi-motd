# rpi-motd
## Installation
```bash
cd rpi-motd
cp motd.tcl /etc/motd.tcl
cp /etc/motd /etc/motd.bak
echo | sudo tee /etc/motd
echo "/etc/motd.tcl" | sudo tee -a /etc/profile
```
