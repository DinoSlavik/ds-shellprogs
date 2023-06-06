#!/bin/bash

if [[ "$INIT_SYSTEM" == "startup" ]]; then # Check is startup now with INIT_SYSTEM variable
    apt-get -q=2 -y update # If startup - update repos
else # Else - use common program

    sudo apt update    # Update repos

    if [[ ${args[0]} == 'dist' ]]; then    # If uses dist parametr perform disro upgrade
        sudo apt dist-upgrade
    elif [[ ${args[0]} == 'full' ]]; then    # If uses dist parametr perform full upgrade
        sudo apt full-upgrade
    else    # Else perform default upgrade
        sudo apt upgrade
    fi
fi

exit 0
