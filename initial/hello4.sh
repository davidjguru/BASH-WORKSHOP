#!/bin/bash
# -*- ENCODING: UTF-8 -*-
#
#
#------------------------------------------------------------------------------
# 
# Just a single Hello World using default parameter from prompt. 
# [David Rodríguez, @davidjguru] [davidjguru@gmail.com]
# Title: Hello World Bash Script V4
# Description: Fourth script echoing Hello World with default param fourth case.
#
# davidjguru@gmail.com
# https://davidjguru.github.io
# https://www.therussianlullaby.com
#------------------------------------------------------------------------------
#
echo "Hello from the script: $0" # $0 represents the script naming.
echo "So hello, $*" # $* Get all the available parameters from $1.
exit 0 # Status code basic exit value without errors in execution.
