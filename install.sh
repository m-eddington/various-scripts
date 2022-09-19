#!/bin/bash
# Script for installing Netbeans and its dependencies
sudo apt update
sudo apt upgrade -y
sudo apt install default-jdk -y
wget https://dlcdn.apache.org/netbeans/netbeans/15/netbeans-15-bin.zip
if sha512sum netbeans-15-bin.zip | grep '5b1a804223ca74c7d00b0f47c5a6bb2b6548193263f87bbd58ed9e846e3241490705dfa5d1fd2c88b2a4fe2db1a8b135640e76dabc4ab9dea2c170ee02c8e30e' 
then
unzip netbeans-15-bin.zip
sudo mv netbeans/ /opt/
echo 'export PATH="$PATH:/opt/netbeans/bin/"' >> /home/$USER/.bashrc
rm netbeans-15-bin.zip
mkdir /home/$USER/.local/share/applications/
echo '#!/usr/bin/env xdg-open' >> /home/$USER/local/share/applications/netbeans.desktop
echo '[Desktop Entry]' >> /home/$USER/.local/share/applications/netbeans.desktop
echo 'Version=15' >> /home/$USER/.local/share/applications/netbeans.desktop
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
rm netbeans-15-bin.zip
exit 0
fi
