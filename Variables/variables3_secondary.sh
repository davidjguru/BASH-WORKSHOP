#!/bin/bash
# -*- ENCODING: UTF-8 -*-
#
#
#------------------------------------------------------------------------------
# 
# Working with variables in bash scripting: Environment variables and scope.
# [David Rodríguez, @davidjguru] [davidjguru@gmail.com]
# Title: Variables Bash Script V3 - Secondary
# Description: Supporting script for the Third example about variables scope.
#
# davidjguru@gmail.com
# https://davidjguru.github.io
# https://www.therussianlullaby.com
#------------------------------------------------------------------------------
#

echo "We are calling the 'name' variable from the secondary script: "
echo $name # We are accesing to the previous exported variable. 

echo "Showing surname from external calling: "
surname="Apellido 2"
echo $surname
