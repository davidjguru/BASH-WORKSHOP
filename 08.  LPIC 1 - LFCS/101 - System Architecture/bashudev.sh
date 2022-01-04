#!/bin/bash
# -*- ENCODING: UTF-8 -*-
#
#
#-------------------------------------------------------------------------------
#
# Bashudev - Registering udev events from your Linux System.
# [David Rodríguez, @davidjguru] [davidjguru@gmail.com]
# Title: Bashudev
# Description: The script will be triggered by some udev event.
# Version: v1.0.0
#
# davidjguru@gmail.com
# https://davidjguru.github.io
# https://www.therussianlullaby.com
#-------------------------------------------------------------------------------
#
# Last Edited: January 03 2022

# How it works

## Version v1.0.0 - Basic identification of a device
##------------------------------------------------------------------------------
## 1- Identify your device reading some output info like: $ lsblk 
## 2- Put a copy of this script in path /usr/bin/bashudev.sh
## 3- Open a file called 80-local.rules in /etc/udev/rules.d and enter code:
##    SUBSYSTEM=="block", ACTION=="add", RUN+="/usr/bin/bashudev.sh"
## 4- Restart or reload your system and plug in a new thumb drive.
## 5- Go to review the /tmp folder and search the bashudev.log.

## Version v2.0.0 - Advanced identification of a device by attributes
##------------------------------------------------------------------------------
## 1- Identify your device: $ lsusb
## 2- Get vendor:product pair of keys, something like ffff:5678
## 3- Put a copy of this script in path /usr/bin/bashudev.sh
## 4- Open a file called 80-local.rules in /etc/udev/rules.d and enter code:
##    SUBSYSTEM=="block", ATTRS{idVendor}=="ffff", ACTION=="add", RUN+="/usr/bin/bashudev.sh"
## 5- Restart or reload your system and plug in a new thumb drive.
##    you can execute something like $ sudo udevadm control --reload
## 6- Go to review the /tmp folder and search the bashudev.log.
## 7- Executes $ tail -f /tmp/bashudev.log and launch the file in prompt.
## 8- Plug in / Plug out diverse thumb drives and check results in prompt.
MSSG="Today => $(date) has been connected the selected thumb drive"
wall $MSSG
echo $MSSG  >> /tmp/bashudev.log



