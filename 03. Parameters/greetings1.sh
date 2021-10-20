#!/bin/bash
# -*- ENCODING: UTF-8 -*-
#
#
#------------------------------------------------------------------------------
# 
# Working with parameters in bash scripting: Reading values from prompt.
# [David Rodríguez, @davidjguru] [davidjguru@gmail.com]
# Title: Greetings Bash Script V1
# Description: First script using parameters. Getting input from console.
#
# davidjguru@gmail.com
# https://davidjguru.github.io
# https://www.therussianlullaby.com
#------------------------------------------------------------------------------
#

echo -n "Hello $(basename $0)! May I ask your name: " # Using echo with -n.
read # Maintains the reading space in the same former line for inputs.
# We didn't provide a return variable we're using the default for read $REPLY.
echo "Hello $REPLY" # Returns answer in a new line. 
exit 0 # Exit with sucess.