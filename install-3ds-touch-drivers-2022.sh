#!/bin/bash -e

# Simple script to install 3DS touch drives

# Use at your own risk!

CUR_DIR=`pwd`

echo "--- Downloading package"
mkdir -p tmp
# curl https://s3.amazonaws.com/dl.3dsystems.com/binaries/Sensable/Linux/TouchDriver2022_04_04.tgz --output tmp/TouchDriver2022_04_04.tgz
cp openhaptics_TouchDrive/TouchDriver2022_04_04.tgz tmp

echo "--- Extracting package"
cd tmp && tar zxvf TouchDriver2022_04_04.tgz

echo "--- Installing"
sudo cp TouchDriver2022_04_04/bin/Touch* /usr/bin
sudo cp TouchDriver2022_04_04/usr/lib/libPhantomIOLib42.so /usr/lib

echo "--- Create and configure shared directory for configuration files"
sudo mkdir -p /usr/share/3DSystems/config

echo "--- Create GTDD_HOME in /etc/environment"
sudo sh -c 'echo "GTDD_HOME=/usr/share/3DSystems" >> /etc/environment'

echo "--- Removing temporary files"
cd $CUR_DIR
rm -rf tmp/TouchDriver2022_04_04*

echo "--- Done"
