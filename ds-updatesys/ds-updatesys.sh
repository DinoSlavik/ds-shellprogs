#!/bin/bash

############################################################
# Help                                                     #
############################################################
Help() {
   # Display Help
   echo "Many apt commands in one command"
   echo
   echo "Syntax: ds-updatesys [-d|f|h|]"
   echo "options:"
   echo "h     Print this Help."
   echo "d     Update system and distro version"
   echo "f     Perform full upgrade version"
   echo
}

############################################################
############################################################
# Program                                                  #
############################################################
############################################################

############################################################
# Functions                                                #
############################################################

DefaultUpdate() {
    sudo apt update    # Update repos
    sudo apt upgrade   # Else perform default upgrade
}

FullUpdate() {
    sudo apt update       # Update repos
    sudo apt full-upgrade # If uses dist parameter perform full upgrade
}

DistroUpdate() {
    sudo apt update       # Update repos
    sudo apt dist-upgrade # If uses dist parameter perform disro upgrade
}

############################################################
# Main Code                                                #
############################################################

while getopts ":h:d:f:" options; do
    case $options in
        h)  # Display Help
            Help ;;
        d)  # Distro update
            DistroUpdate ;;
        f)  # Full update
            FullUpdate ;;
        #*)  #Default update
        #    DefaultUpdate ;;
    esac
done
