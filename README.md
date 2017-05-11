# rpi-motd
## PREREQUISITES:
TCLSH: View if you have tclsh installed:
```bash
dpkg -l | grep tcl
```
Reply if you do have it installed will be similar to:
```bash
tcl8.5  8.5.3-2  Tcl (the Tool Command Language) v8.5 - run-t
tcl8.5-dev  8.5.3-2  Tcl (the Tool Command Language) v8.5 - devel
```
If not:
```bash
sudo apt install tcl
```
## Installation
```bash
cd rpi-motd
cp motd.tcl /etc/motd.tcl
# Backup current motd
cp /etc/motd /etc/motd.bak
# Empty current motd
echo | sudo tee /etc/motd
echo "/etc/motd.tcl" | sudo tee -a /etc/profile
```

## License
DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE  

DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE 
TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION 

0. You just DO WHAT THE FUCK YOU WANT TO.
