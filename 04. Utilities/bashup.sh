#!/bin/bash
# -*- ENCODING: UTF-8 -*-
#
#
#-------------------------------------------------------------------------------
#
# Bashup - Execute backups from bash.
# [David Rodríguez, @davidjguru] [davidjguru@gmail.com]
# Title: Bashup 2000
# Description: Build backups for specific files and folders.
# Version: v1.0.0
#
# davidjguru@gmail.com
# https://davidjguru.github.io
# https://www.therussianlullaby.com
#-------------------------------------------------------------------------------
#
# Last Edited: November 04 2021

# Take input from console.
read -p "Which file type to backup? Please introduce extension..." file_suffix
read -p "Which folder to backup to? Please introduce destiny..." dir_name

# Create directory if not exists.
test -d $HOME/$dir_name || mkdir -m 700 $HOME/$dir_name

# Execute search matching criteria and purging the same backup folder.
find $HOME -path $HOME/$dir_name -prune -o -name "*$file_suffix" \
-exec cp {} $HOME/$dir_name/ \;
exit 0