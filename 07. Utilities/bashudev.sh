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

## Version v1.0.0 - Basic identification of a new device
##------------------------------------------------------------------------------
## 1- Identify your device reading some output info like: $ lsblk 
## 2- Put a copy of this script in path /usr/bin/bashudev.sh
## 3- Open a file called 80-local.rules in /etc/udev/rules.d and enter code:
## SUBSYSTEM=="block", ACTION=="add", RUN+="/usr/bin/bashudev.sh"
## 4- Restart or reload your system and plug in a new thumb drive.
## 5- Go to review the /tmp folder and search the bashudev.log.
date >> /tmp/bashudev.log