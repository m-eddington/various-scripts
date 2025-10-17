#!/bin/bash
# Script for uninstalling Netbeans and its dependencies
echo 'Uninstalling Netbeans..'
sudo apt remove default-jdk -y
sudo apt autoremove -y
sudo apt clean
sudo rm -rf /opt/netbeans
rm /home/$USER/.local/share/applications/netbeans.desktop
grep -v 'export PATH="$PATH:/opt/netbeans/bin/"' /home/$USER/.bashrc > tmp && mv tmp /home/$USER/.bashrc
echo 'Netbeans removed..'
exit 0
