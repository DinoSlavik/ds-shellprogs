#!/bin/bash

read -p "Use dist-upgrade? (y/n) " dist_upgrade    # Create a variable that tells if a user wants to use dist-upgrade

if [ $dist_upgrade = 'y' ] || [ $dist_upgrade = 'Y' ]; then    # If a user wants to use dist-upgrade use it
    sudo apt update
    sudo apt upgrade -y
    sudo apt dist-upgrade -y
elif [ $dist_upgrade = 'n' ] || [ $dist_upgrade = 'N' ]; then    # Else use a basic upgrade
    sudo apt update
    sudo apt upgrade -y
else    # If pressed other key exit from the program
    exit
fi
