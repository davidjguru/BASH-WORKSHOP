#!/bin/bash
# -*- ENCODING: UTF-8 -*-
#
#
#------------------------------------------------------------------------------
#
# Druclinic - Print a report about the current status of a Drupal installation.
# [David Rodríguez, @davidjguru] [davidjguru@gmail.com]
# Title: Drupal Current Status Reporting
# Description: Takes basic commands getting info from Drupal filling a summary.
# Version: v1.0.0
#
# davidjguru@gmail.com
# https://davidjguru.github.io
# https://www.therussianlullaby.com
#------------------------------------------------------------------------------
#

# Load a set of colors. 
load_colors () {
  BLACK='\033[0;30m'     
  RED='\033[0;31m'
  GREEN='\033[0;32m'
  ORANGE='\033[0;33m'
  YELLOW='\033[1;33m'
  BLUE='\033[0;34m'
  PURPLE='\033[0;35m'
  CYAN='\033[0;36m'
  WHITE='\033[0;37m'
  NC='\033[0m' # No Color.
}

# Load a set of messages. 
load_messages () {
  STEP_ONE="    ${CYAN}STEP ONE: GETTING INFO ABOUT CONFIG FILES, CONTENT TYPES AND PARAGRAPHS.${NC}\n"
  CONFIG_OPERATIONS="    ${CYAN}-----------------------------------------------------------------------------------------------\n\n
    After initial loads, we're going to search the config files looking for related info...\n\n\
    ----------------------------------------------------------------------------------------------- \n\n${NC}"

}

# Print selected messages. 
print_messages () {
  if [ $1 = "S1" ]
    then
       echo -e "${STEP_ONE}"
  elif [ $1 = "c" ] 
    then   
      echo -e "${CONFIG_OPERATIONS}"
      sleep 2
  fi
} 

# Print the initial Splash in console.
print_splash () {
  echo -e  "\n\n\n\n"
  sleep 1
  echo -e " ${BLUE}  ________  ________  ___  ___  ________  ___       ___  ________   ___  ________      "    
  sleep 3
  echo "  |\   ___ \|\   __  \|\  \|\  \|\   ____\|\  \     |\  \|\   ___  \|\  \|\   ____\     "    
  sleep 3
  echo "  \ \  \_|\ \ \  \|\  \ \  \\\\\\  \ \  \___|\ \  \    \ \  \ \  \\\ \  \ \  \ \  \___|     "
  sleep 3
  echo "   \ \  \ \\\ \ \   _  _\ \  \\\\\\  \ \  \    \ \  \    \ \  \ \  \\\ \  \ \  \ \  \        "
  sleep 1
  echo "    \ \  \_\\\ \ \  \\\   \ \  \\\\\  \ \  \____\ \  \____\ \  \ \  \\\ \  \ \  \ \  \____   "  
  sleep 1
  echo "     \ \_______\ \__\\\ _\\\ \_______\ \_______\ \_______\ \__\ \__\\\ \__\ \__\ \_______\ "
  sleep 1
  echo -e "      \|_______|\|__|\|__|\|_______|\|_______|\|_______|\|__|\|__| \|__|\|__|\|_______| ${NC}"
  sleep 1
  echo -e  "\n\n   ${GREEN} Druclinic - v1.0.0"
  sleep 1
  echo  -e "    Druclinic - Get a report about the status of a Drupal installation..."
  sleep 1
  echo  -e "    Created by David Rodríguez, @davidjguru. October 2021. davidjguru@gmail.com"
  echo  -e "    \e]8;;https://www.therussianlullaby.com\ahttps://www.therussianlullaby.com\e]8;;\a - \e]8;;https://davidjguru.github.io\ahttps://davidjguru.github.io\e]8;;\a"
  sleep 1
  echo  -e "\n\n    As an utility based in FLOSS (Free, Libre & Open Source Software),"
  echo  -e "    You will have the four essential freedoms:"
  echo  -e "    0- The freedom to run the program as you wish, for any purpose (freedom 0)"
  echo  -e "    1- The freedom to study how the program works, and change it (freedom 1)"
  echo  -e "            *(Access to the source code is a precondition for this)"
  echo  -e "    2- The freedom to redistribute copies so you can help others (freedom 2)"
  echo  -e "    3- The freedom to distribute copies of your modified versions to others (freedom 3)"
  echo  -e "           *(Doing this you can give the community a chance to benefit of your changes)"
  sleep 1
  echo  -e "\n\n                   Licensed under GPL - GNU General Public License, version 3"
  echo  -e "\n                   More info at: https://www.gnu.org/licenses/gpl-3.0.en.html ${NC}"
  sleep 1
  echo -e  "\n\n\n\n"
}

# Count values from files in config folder.
counting_config_files () {
  config_path="./config/sync"
  no_config=1
  if [ -d $config_path ] 
    then
      echo -e " ${CYAN} Info:${NC} Directory /config/sync exists." 
  else
      echo -e " ${CYAN} Info:${NC} Directory /config/sync does not exists. Going to /files folder."
      config_path="./web/sites/default/files/sync"
      if [ ! -d $config_path ]
        then
          echo -e " ${CYAN} Info:${NC} Directory /files/sync does not exist either."
          no_config=0
      fi
  fi
  
  if [ $no_config -eq 1 ]
    then
      config_files=$(ls -lah $config_path 2> /dev/null | wc -l)
      content_types=$(ls -lah $config_path/node.type.* 2> /dev/null | wc -l)
      paragraph_items=$(ls -lah $config_path/paragraphs.paragraphs_type.*  2> /dev/null | wc -l)
      block_items=$(ls -lah $config_path/block.block.*  2> /dev/null | wc -l)
      vocabulary_items=$(ls -lah $config_path/taxonomy.vocabulary*  2> /dev/null | wc -l)
      field_items=$(ls -lah $config_path/field.storage*  2> /dev/null | wc -l)
      view_items=$(ls -lah $config_path/views.view*  2> /dev/null | wc -l)
      user_roles=$(ls -lah $config_path/user.role*  2> /dev/null | wc -l)
      echo -e " ${CYAN} Number of config files:${NC} $config_files" 
      echo -e " ${CYAN} Number of content types:${NC} $content_types"
      echo -e " ${CYAN} Number of paragraphs:${NC} $paragraph_items"
      echo -e " ${CYAN} Number of existing blocks:${NC} $block_items"
      echo -e " ${CYAN} Number of vocabularies:${NC} $vocabulary_items"
      echo -e " ${CYAN} Number of existing fields:${NC} $field_items"
      echo -e " ${CYAN} Number of Views:${NC} $view_items"
      echo -e " ${CYAN} Number of User Roles:${NC} $user_roles"
      echo -e ""
      echo -e  "\n\n\n\n"
  else
    echo -e " ${ORANGE} Warning:${NC} We could not find any configuration files, the usual addresses do not exist.\n\n"
  fi
}

# Calculating space use
calculating_space_use () {
  root_folder="./web/"
  
  if [ ! -d $root_folder ]
    then
      root_folder="./root/"
      if [ ! -d $root_folder ]
        then
          root_folder="zero"
          echo -e " ${CYAN} Info:${NC} Directory root is not available." 
      else 
        echo -e " ${CYAN} Info:${NC} Directory root named as 'root'."
      fi
  else
     echo -e " ${CYAN} Info:${NC} Directory root named as 'web'."
  fi
  
  if [ $root_folder != "zero" ]
    then 
      total_size=$(du -sh ./ 2> /dev/null)
      partial_size=$(du -sh ./* 2> /dev/null)
      web_size=$(du -sh $root_folder* 2> /dev/null)
      files_size=$(du -sh $root_folder/sites/default/files/ 2> /dev/null)
      echo -e " ${CYAN} Total size:${NC} $total_size\n\n" 
      echo -e " ${CYAN} Size partial by folder: \n\n${NC} $partial_size\n\n" 
      echo -e " ${CYAN} Size of the root folder: \n\n${NC} $web_size\n\n"
      echo -e " ${CYAN} Size of the /files folder:\n\n${NC} $files_size"
      echo -e  "\n\n\n\n"
  else 
    echo -e " ${ORANGE} Warning:${NC} There is no root folder available."
    echo -e "  The project was not yet mounted by Composer or the name differs from the usual ones.\n\n" 
  fi
}

# Calling functions zone
# Initial load functions.
load_colors
load_messages
print_splash
print_messages S1
print_messages c
counting_config_files
echo -e " ${CYAN} After initial loads, we're going to inspect info about config files and content types...\n\n\n"
sleep 2
calculating_space_use