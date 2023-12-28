#!/bin/bash
# Script for installing Netbeans and its dependencies
sudo apt update
sudo apt upgrade -y
sudo apt install default-jdk -y
wget https://dlcdn.apache.org/netbeans/netbeans/20/netbeans-20-bin.zip
if sha512sum netbeans-20-bin.zip | grep '59eb2b0e7887f0d962d180c4004a81cf752f12a2b9456c59417daf90a312877f697500580c53566a220bde2a49df2b95ba1e4dedb4cf59b49bdacdc47c98745f'
then
unzip netbeans-20-bin.zip
sudo mv netbeans/ /opt/
echo 'export PATH="$PATH:/opt/netbeans/bin/"' >> /home/$USER/.bashrc
rm netbeans-20-bin.zip
mkdir -p /home/$USER/.local/share/applications/
echo '#!/usr/bin/env xdg-open' >> /home/$USER/.local/share/applications/netbeans.desktop
echo '[Desktop Entry]' >> /home/$USER/.local/share/applications/netbeans.desktop
echo 'Version=20' >> /home/$USER/.local/share/applications/netbeans.desktop
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
rm netbeans-20-bin.zip
exit 0
fi
