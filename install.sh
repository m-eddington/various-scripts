#!/bin/bash
# Script for installing Netbeans and its dependencies
sudo apt update
sudo apt upgrade -y
sudo apt install default-jdk -y
wget https://dlcdn.apache.org/netbeans/netbeans/22/netbeans-22-bin.zip
if sha512sum netbeans-22-bin.zip | grep '1d8ad549f9a2bfd8ee829691de1f7a22d35d0c2782676e2bc64eec32751e0edbda8a0240eec1ffd0a7e033f9fb2619b9e3ca1ddad40609f1d722a4deea16c0b6'
then
unzip netbeans-22-bin.zip
sudo mv netbeans/ /opt/
echo 'export PATH="$PATH:/opt/netbeans/bin/"' >> /home/$USER/.bashrc
rm netbeans-22-bin.zip
mkdir -p /home/$USER/.local/share/applications/
echo '#!/usr/bin/env xdg-open' >> /home/$USER/.local/share/applications/netbeans.desktop
echo '[Desktop Entry]' >> /home/$USER/.local/share/applications/netbeans.desktop
echo 'Version=22' >> /home/$USER/.local/share/applications/netbeans.desktop
echo 'Type=Application' >> /home/$USER/.local/share/applications/netbeans.desktop
echo 'Terminal=false' >> /home/$USER/.local/share/applications/netbeans.desktop
echo 'Exec=/opt/netbeans/bin/netbeans' >> /home/$USER/.local/share/applications/netbeans.desktop
echo 'Name=Netbeans' >> /home/$USER/.local/share/applications/netbeans.desktop
echo 'Comment=Netbeans' >> /home/$USER/.local/share/applications/netbeans.desktop
echo 'Icon=/opt/netbeans/logotype1.png' >> /home/$USER/.local/share/applications/netbeans.desktop
sudo wget https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/Apache_NetBeans_Logo.svg/200px-Apache_NetBeans_Logo.svg.png -O /opt/netbeans/logotype1.png
echo 'Netbeans installed'
sudo apt clean
exit 0
else
echo 'Checksum missmatch, please run the install script again.'
rm netbeans-22-bin.zip
exit 0
fi
