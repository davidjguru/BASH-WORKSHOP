#!/bin/bash
# -*- ENCODING: UTF-8 -*-
#
#
#------------------------------------------------------------------------------
# 
# Just a single Hello World using some parameters from prompt. 
# [David Rodríguez, @davidjguru] [davidjguru@gmail.com]
# Title: Hello World Bash Script V5
# Description: Fifth script echoing Hello World with some params fifth case.
#
# davidjguru@gmail.com
# https://davidjguru.github.io
# https://www.therussianlullaby.com
#------------------------------------------------------------------------------
#
echo "Hello you are using: $0" # $0 represents the script naming.
echo "And specifically using: $(basename $0)" # using basename to cut the path. 
echo "So hello, $*" # $* Get all the available parameters from $1.
exit 0 # Status code basic exit value without errors in execution.
