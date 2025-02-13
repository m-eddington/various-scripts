#!/bin/bash
# Script for installing Netbeans and its dependencies
# Go to https://netbeans.apache.org/front/main/download/ and select the
# "Binaries (Platform Independent)" release. Enter the links below.
# Netbeans link:
Nlink="https://dlcdn.apache.org/netbeans/netbeans/24/netbeans-24-bin.zip"
# Netbeans sha512 checksum file:
Nsha512="https://downloads.apache.org/netbeans/netbeans/24/netbeans-24-bin.zip.sha512"
############################################################################################
sudo apt update
sudo apt upgrade -y
sudo apt install default-jdk curl -y
Nsum=$(curl -s $Nsha512 | cut -c 1-128)
Nversion=$(curl -s $Nsha512 | cut -c 142-143)
Nname=$(curl -s $Nsha512 | cut -c 133-151)
curl -s $Nlink -o $Nname
if sha512sum $Nname | grep $Nsum
then
unzip $Nname
sudo mv netbeans/ /opt/
echo 'export PATH="$PATH:/opt/netbeans/bin/"' >> /home/$USER/.bashrc
rm $Nname
mkdir -p /home/$USER/.local/share/applications/
echo '#!/usr/bin/env xdg-open' >> /home/$USER/.local/share/applications/netbeans.desktop
echo '[Desktop Entry]' >> /home/$USER/.local/share/applications/netbeans.desktop
echo '"Version='$Nversion'"' >> /home/$USER/.local/share/applications/netbeans.desktop
echo 'Type=Application' >> /home/$USER/.local/share/applications/netbeans.desktop
echo 'Terminal=false' >> /home/$USER/.local/share/applications/netbeans.desktop
echo 'Exec=/opt/netbeans/bin/netbeans' >> /home/$USER/.local/share/applications/netbeans.desktop
echo 'Name=Netbeans' >> /home/$USER/.local/share/applications/netbeans.desktop
echo 'Comment=Netbeans' >> /home/$USER/.local/share/applications/netbeans.desktop
echo 'Icon=/opt/netbeans/logotype1.png' >> /home/$USER/.local/share/applications/netbeans.desktop
sudo curl -s https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/Apache_NetBeans_Logo.svg/200px-Apache_NetBeans_Logo.svg.png -O /opt/netbeans/logotype1.png
echo 'Netbeans installed'
sudo apt clean
exit 0
else
echo 'Checksum missmatch, please run the install script again.'
rm $Nname
exit 0
fi
