#!/bin/bash
# Script for building openomf - https://github.com/omf2097/openomf
# Make sure you've got all the required dependencies listed at https://github.com/omf2097/openomf/blob/master/BUILD.md#openomf-installation
###
installdir=/home/$USER/openomf
###

get-assets (){
if [ ! -f "$installdir/openomf-assets.zip" ];
then
curl -s https://www.omf2097.com/pub/files/omf/openomf-assets.zip -o $installdir/openomf-assets.zip
unzip -qq -j $installdir/openomf-assets.zip -d $installdir/openomf/resources/
else
exit 0
fi
}

make-install (){
cd $installdir/openomf
cmake -DCMAKE_BUILD_TYPE=Portable -DCMAKE_INSTALL_PREFIX=/$installdir .
make -j $(nproc)
make install
rm -rf $installdir/share/
rm -rf $installdir/bin
}

git-openomf (){
if [ ! -d "$installdir/openomf" ];
then
git clone https://github.com/omf2097/openomf.git $installdir/openomf
cd $installdir/openomf
make-install
get-assets
else
    cd $installdir/openomf
    if git pull | grep "Already up to date."
    then
    exit 0
    else
    make-install
    fi
fi
}
#################

git-openomf

exit 0
