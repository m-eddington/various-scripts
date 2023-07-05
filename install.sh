#!/bin/bash
# Script for installing Netbeans and its dependencies
sudo apt update
sudo apt upgrade -y
sudo apt install default-jdk -y
wget https://dlcdn.apache.org/netbeans/netbeans/18/netbeans-18-bin.zip
if sha512sum netbeans-18-bin.zip | grep 'f45ed089874b681d912d9650a7d42a674cd15dd4e1a5929d64899fa1383b576b83f050855f749983ecbef216f4d2a9125e30ddc273e282d11f12ce80a4760411'
then
unzip netbeans-18-bin.zip
sudo mv netbeans/ /opt/
echo 'export PATH="$PATH:/opt/netbeans/bin/"' >> /home/$USER/.bashrc
rm netbeans-18-bin.zip
mkdir -p /home/$USER/.local/share/applications/
echo '#!/usr/bin/env xdg-open' >> /home/$USER/.local/share/applications/netbeans.desktop
echo '[Desktop Entry]' >> /home/$USER/.local/share/applications/netbeans.desktop
echo 'Version=18' >> /home/$USER/.local/share/applications/netbeans.desktop
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
rm netbeans-18-bin.zip
exit 0
fi
