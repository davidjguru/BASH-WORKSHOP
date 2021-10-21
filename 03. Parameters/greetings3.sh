#!/bin/bash
# -*- ENCODING: UTF-8 -*-
#
#
#------------------------------------------------------------------------------
# 
# Working with parameters in bash scripting: Limiting number of characters.
# [David Rodríguez, @davidjguru] [davidjguru@gmail.com]
# Title: Greetings Bash Script V3
# Description: Third script using parameters. Limiting entered characters.
#
# davidjguru@gmail.com
# https://davidjguru.github.io
# https://www.therussianlullaby.com
#------------------------------------------------------------------------------
#

read -p "Hello from $(basename $0)! May I ask your name: "  name
echo "Hello Dear $name"
# In the next steps the script will stop until you entered a character.
read -n1 -p "Press any key to exit"
# How it works: 
# -n1 marks the number of characters to introduce (1).
# -p as in former scripts is asking for values for prompt.
# Just when read command get the number of marked characters by prompt
# the script will follow its flow.
exit 0 # Exit with sucess.