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
# Last Edited: November 08 2021

# Take input from console.
read -p "Which file type to backup? Please introduce extension: " file_suffix
read -p "Which folder to backup to? Please introduce destiny: " dir_name
read -p "Select the compression format [tar.gz, tar, gz, zip]: " compression

# Create directory if not exists.
destiny_path=$HOME/$dir_name
test -d $destiny_path || mkdir -m 700 $destiny_path

# Execute search matching criteria and purging the same backup folder.
find $HOME -path $destiny_path -prune -o -name "*$file_suffix" \
-exec cp {} $destiny_path/ \;

# Execute the compression operation.
cd $HOME
case "$compression" in 
  tar.gz )
    tar -czvf $dir_name.tar.gz $destiny_path
    ;;
  tar )
    tar -cvf $dir_name.tar $destiny_path
    ;;
  gz )
    gzip -9 -r $destiny_path
    ;;
  zip )
    zip -r $dir_name.zip $destiny_path
    ;;
  *)
    echo "Sorry but your input wasn't a valid option."
esac

# Gives a summary for the backup works.
echo -e "\nWere copied $(ls -la $destiny_path | wc -l) files in $destiny_path."
exit 0