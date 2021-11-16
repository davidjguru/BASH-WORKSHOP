#!/bin/bash
# -*- ENCODING: UTF-8 -*-
#
#
#-------------------------------------------------------------------------------
#
# Bashware - Get a summary about hardware from bash.
# [David Rodríguez, @davidjguru] [davidjguru@gmail.com]
# Title: Bashwar 2000
# Description: Prepares summaries with data hardware-related.
# Version: v1.0.0
#
# davidjguru@gmail.com
# https://davidjguru.github.io
# https://www.therussianlullaby.com
#-------------------------------------------------------------------------------
#
# Last Edited: November 16 2021

# CPU info. 
echo "Number of available processors: " $(grep -c name /proc/cpuinfo)
echo "Number of CPU cores: " $(cat /proc/cpuinfo | grep "cpu cores" | head -1 | cut -c 14-)
echo "Model of CPU: " $(cat /proc/cpuinfo | grep "model name" | head -1 | cut -c 14-)
