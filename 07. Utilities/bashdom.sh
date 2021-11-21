
#!/bin/bash
# -*- ENCODING: UTF-8 -*-
#
#
#-------------------------------------------------------------------------------
#
# Bashdom - Compiles random commands for a Linux distribution.
# [David Rodríguez, @davidjguru] [davidjguru@gmail.com]
# Title: Bashdom 2000
# Description: Only register random commands.
# Version: v1.0.0
#
# davidjguru@gmail.com
# https://davidjguru.github.io
# https://www.therussianlullaby.com
#-------------------------------------------------------------------------------
#
# Last Edited: November 21 2021

# Go to the /bin directory and check how many executable programs are available in Single User Mode.
cd /bin && ls -la | wc -l

# [ec2-user@ip-172-31-33-217 ~]$ cd /bin && ls -la | wc -l
# 795

# Go to the /boot folder and review the booting resources.  
cd /boot && ls -la 

# [ec2-user@ip-172-31-33-217 boot]$ ls -la
# total 146692
# dr-xr-xr-x.  5 root root     4096 Nov 21 12:43 .
# dr-xr-xr-x. 18 root root      236 May  4  2021 ..
# -rw-r--r--.  1 root root      166 Apr 29  2021 .vmlinuz-4.18.0-305.el8.x86_64.hmac
# -rw-------.  1 root root  4164308 Apr 29  2021 System.map-4.18.0-305.el8.x86_64
# -rw-r--r--.  1 root root   192091 Apr 29  2021 config-4.18.0-305.el8.x86_64
# drwxr-xr-x.  3 root root       17 May  4  2021 efi
# drwx------.  4 root root       83 Nov 21 13:48 grub2
# -rw-------.  1 root root 61624436 May  4  2021 initramfs-0-rescue-bd6cf7372f924f33ab49bd9e121a3895.img
# -rw-------.  1 root root 48388839 May  4  2021 initramfs-4.18.0-305.el8.x86_64.img
# -rw-------.  1 root root 15772249 Nov 21 12:43 initramfs-4.18.0-305.el8.x86_64kdump.img
# drwxr-xr-x.  3 root root       21 May  4  2021 loader
# -rwxr-xr-x.  1 root root 10026352 May  4  2021 vmlinuz-0-rescue-bd6cf7372f924f33ab49bd9e121a3895
# -rwxr-xr-x.  1 root root 10026352 Apr 29  2021 vmlinuz-4.18.0-305.el8.x86_64

# List all directories as a tree, but without using 'tree' command if you didn't install this.
find . -type d | sed -e "s/[^-][^\/]*\//  |/g" -e "s/|\([^ ]\)/| - \1/"

# It will show the consumption of Storage in your System from /.
cd / && sudo du -shxc * --exclude=proc

# 0	bin
# 149M	boot
# [...]
# 0	tmp
# 706M	usr
# 287M	var
# 1.2G	total

# Get available amount of memory in the system in a human readable format.
free -h
#               total        used        free      shared  buff/cache   available
# Mem:           31Gi        10Gi       6,8Gi       2,1Gi        13Gi        18Gi
# Swap:         2,0Gi          0B       2,0Gi
