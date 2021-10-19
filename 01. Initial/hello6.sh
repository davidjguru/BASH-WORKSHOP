#!/bin/bash
# -*- ENCODING: UTF-8 -*-
#
#
#------------------------------------------------------------------------------
# 
# Just a single Hello World using parameters and counting values from prompt. 
# [David Rodríguez, @davidjguru] [davidjguru@gmail.com]
# Title: Hello World Bash Script V6
# Description: Sixth script echoing Hello World with some params sixth case.
#
# davidjguru@gmail.com
# https://davidjguru.github.io
# https://www.therussianlullaby.com
#------------------------------------------------------------------------------
#
echo "Hello you are using: $0" # $0 represents the script naming.
echo "And specifically using: $(basename $0)" # Using basename to cut the path.
echo "You introduced values, a total of $# values." # Counting provided values. 
echo "So hello, $*" # $* Get all the available parameters from $1.
exit 0 # Status code basic exit value without errors in execution.
