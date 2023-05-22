#!/bin/bash
# Script for installing Netbeans and its dependencies
sudo apt update
sudo apt upgrade -y
sudo apt install default-jdk -y
wget https://dlcdn.apache.org/netbeans/netbeans/17/netbeans-17-bin.zip
if sha512sum netbeans-17-bin.zip | grep 'f513d86a2a3f86ff56947fa1721426da331d9b5d45a67a4fc460f7eb1cd5e53557eb79ed2feb1dae301012448c05d2bd2c56175fdbd997ba2a09f274d9862dfb' 
then
unzip netbeans-17-bin.zip
sudo mv netbeans/ /opt/
echo 'export PATH="$PATH:/opt/netbeans/bin/"' >> /home/$USER/.bashrc
rm netbeans-17-bin.zip
mkdir -p /home/$USER/.local/share/applications/
echo '#!/usr/bin/env xdg-open' >> /home/$USER/.local/share/applications/netbeans.desktop
echo '[Desktop Entry]' >> /home/$USER/.local/share/applications/netbeans.desktop
echo 'Version=17' >> /home/$USER/.local/share/applications/netbeans.desktop
echo 'Type=Application' >> /home/$USER/.local/share/applications/netbeans.desktop
echo 'Terminal=false' >> /home/$USER/.local/share/applications/netbeans.desktop
echo 'Exec=/opt/netbeans/bin/netbeans' >> /home/$USER/.local/share/applications/netbeans.desktop
echo 'Name=Netbeans' >> /home/$USER/.local/share/applications/netbeans.desktop
echo 'Comment=Netbeans' >> /home/$USER/.local/share/applications/netbeans.desktop
echo 'Icon=/opt/netbeans/logotype1.png' >> /home/$USER/.local/share/applications/netbeans.desktop
sudo wget https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/Apache_NetBeans_Logo.svg/200px-Apache_NetBeans_Logo.svg.png -O /opt/netbeans/logotype1.png
echo 'Netbeans installed'
exit 0
else
echo 'Checksum missmatch, please run the install script again.'
rm netbeans-17-bin.zip
exit 0
fi
