#!/bin/bash
# -*- ENCODING: UTF-8 -*-
#
#
#-------------------------------------------------------------------------------
#
# Bashing - Execute ping to a remote server.
# [David Rodríguez, @davidjguru] [davidjguru@gmail.com]
# Title: Bashing
# Description: Launch ping from console to remote server.
# Version: v1.0.0
#
# davidjguru@gmail.com
# https://davidjguru.github.io
# https://www.therussianlullaby.com
#-------------------------------------------------------------------------------
#
# Last Edited: November 08 2021

read -p "Which server should be pinged? " server_address
ping -c3 $server_address 2>1 > /dev/null || echo "Server not responding..."
