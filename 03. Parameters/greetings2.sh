#!/bin/bash
# -*- ENCODING: UTF-8 -*-
#
#
#------------------------------------------------------------------------------
# 
# Working with parameters in bash scripting: Reading values from prompt.
# [David Rodríguez, @davidjguru] [davidjguru@gmail.com]
# Title: Greetings Bash Script V2
# Description: Second script using parameters. Getting input from console.
#
# davidjguru@gmail.com
# https://davidjguru.github.io
# https://www.therussianlullaby.com
#------------------------------------------------------------------------------
#

read -p "Hello from $(basename $0)! May I ask your name: "  name
echo "Hello Dear $name"
exit 0 # Exit with sucess.