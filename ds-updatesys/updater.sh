#!/bin/bash

read -p "Use dist-upgrade? (y/n) " dist_upgrade

if [ $dist_upgrade = 'y' ] || [ $dist_upgrade = 'Y' ]; then
    sudo apt update
    sudo apt upgrade -y
    sudo apt dist-upgrade -y
elif [ $dist_upgrade = 'n' ] || [ $dist_upgrade = 'N' ]; then
    sudo apt update
    sudo apt upgrade -y
else
    exit
fi
