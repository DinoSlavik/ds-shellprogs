#!/bin/bash

sudo apt update    # Update repos

if [ ${args[0]} = 'dist' ]; then    # If uses dist parameter perform disro upgrade
    sudo apt dist-upgrade
elif [ ${args[0]} = 'full' ]; then    # If uses dist parameter perform full upgrade
    sudo apt full-upgrade
else    # Else perform default upgrade
    sudo apt upgrade
fi
