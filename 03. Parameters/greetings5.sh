#!/bin/bash
# -*- ENCODING: UTF-8 -*-
#
#
#------------------------------------------------------------------------------
# 
# Working with parameters in bash scripting: Reading options.
# [David Rodríguez, @davidjguru] [davidjguru@gmail.com]
# Title: Greetings Bash Script V5
# Description: Fifth script using parameters. Reading options.
#
# davidjguru@gmail.com
# https://davidjguru.github.io
# https://www.therussianlullaby.com
#------------------------------------------------------------------------------
#

# Now we're gonna execute this script using options -a, -b, -c from console.
read -s -p "Hello from $(basename $0)! May I ask your name: "  name
# We're always reading the $1 item, shifting parameters order when reading it.
# In that way we control step by step all the passed parameters.
# Check that if you load more than one param, then will print the last one,
# Due to shift the input until the last of the parameters. 
while [ -n "$1" ]
  do
    case "$1" in
      -a) greeting_treatment="Dear" ;;
      -b) greeting_treatment="Mister" ;;
      -c) greeting_treatment="Miss" ;;
      *) echo "Option $1 is not an option" ;;
    esac
    shift
  done
echo -e "\nHello $greeting_treatment $name"
read -n1 -p "Press any key to exit"
exit 0 # Exit with sucess.