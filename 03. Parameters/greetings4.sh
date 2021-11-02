#!/bin/bash
# -*- ENCODING: UTF-8 -*-
#
#
#------------------------------------------------------------------------------
# 
# Working with parameters in bash scripting: Hiding input.
# [David Rodríguez, @davidjguru] [davidjguru@gmail.com]
# Title: Greetings Bash Script V4
# Description: Fourth script using parameters. Hiding entered characters.
#
# davidjguru@gmail.com
# https://davidjguru.github.io
# https://www.therussianlullaby.com
#------------------------------------------------------------------------------
#

read -s -p "Hello from $(basename $0)! May I ask your name: "  name
# Now by using -s (silent option) we will not see the introduced value when typing.
echo "Hello Dear $name"
read -n1 -p "Press any key to exit"
exit 0 # Exit with sucess.