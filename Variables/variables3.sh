#!/bin/bash
# -*- ENCODING: UTF-8 -*-
#
#
#------------------------------------------------------------------------------
# 
# Working with variables in bash scripting: Environment variables and scope.
# [David Rodríguez, @davidjguru] [davidjguru@gmail.com]
# Title: Variables Bash Script V3
# Description: Third script using variables, using environment variables.
#
# davidjguru@gmail.com
# https://davidjguru.github.io
# https://www.therussianlullaby.com
#------------------------------------------------------------------------------
#

echo "There are a lot of variables that we didn't define...the so called 'Environment variables'..."
echo "Let's see all the environments variables in your sistem: "
printenv
echo "Ok, but how many are?..."
printenv | wc -l 
echo "You can print a specific environment variable, like 'HOME' -> " $HOME

# Now we want passing some values to a secondary script. 
name=$USER 
export name # Now the variable will be available from other processes.
./variables3_secondary.sh 

# And now another test changing values in order to check scope. 
surname="Apellido 1"
export surname 
./variables3_secondary.sh
echo $surname
echo "Can you see what's happening here?..."