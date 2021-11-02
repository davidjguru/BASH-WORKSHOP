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
  HEADER="    Druclinic - v1.0.0\n"
  SUBHEADER="     Druclinic - Get a report about the status of a Drupal installation."
  CREATEDBY="     Created by David Rodríguez, @davidjguru. October 2021. davidjguru@gmail.com \n
     https://www.therussianlullaby.com  -  https://davidjguru.github.io"
  
  STEP_ONE="    -----------------------------------------------------------------------------------------------\n\n
    STEP ONE: GETTING INFO ABOUT FOLDERS AND FILES.
    Let's count the total number of files and folders in the project directory...\n\n\
    ----------------------------------------------------------------------------------------------- \n\n"
    
  STEP_TWO="    -----------------------------------------------------------------------------------------------\n\n
    STEP TWO: GETTING INFO ABOUT DOCKER CONFIGURATIONS OR LOCAL CONTAINERS.
    Now we inspect if the project has container configurations (ddev, lando, dockerfiles)...\n\n\
    ----------------------------------------------------------------------------------------------- \n\n"
  
  STEP_THREE="    -----------------------------------------------------------------------------------------------\n\n
    STEP THREE: GETTING INFO ABOUT CONFIG FILES, CONTENT TYPES AND PARAGRAPHS.
    We are going to search config files looking for content types, views, paragraphs, users...\n\n\
    ----------------------------------------------------------------------------------------------- \n\n"

  STEP_FOUR="    -----------------------------------------------------------------------------------------------\n\n
    STEP FOUR: GETTING INFO ABOUT USING SPACE IN DISK.
    Let's inspect how much space the project's folders and resources occupy....\n\n\
    ----------------------------------------------------------------------------------------------- \n\n"
}

# Print selected messages. 
print_messages () {
  if [ $1 = "S1" ]
    then
       echo -e "${CYAN}${STEP_ONE}${NC}" | tee -a druclinic.txt
  elif [ $1 = "S2" ] 
    then   
      echo -e "${CYAN}${STEP_TWO}${NC}" | tee -a druclinic.txt
  elif [ $1 = "S3" ] 
    then   
      echo -e "${CYAN}${STEP_THREE}${NC}" | tee -a druclinic.txt
  elif [ $1 = "S4" ] 
    then   
      echo -e "${CYAN}${STEP_FOUR}${NC}" | tee -a druclinic.txt
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
  echo -e  "\n\n${GREEN} ${HEADER}" | tee -a druclinic.txt
  sleep 1
  echo  -e "${SUBHEADER}" | tee -a druclinic.txt
  sleep 1
  echo  -e "${CREATEDBY}" | tee -a druclinic.txt
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

# Count numbers of files and folders withing the project directory.
counting_files_and_folders () {
  number_of_files=$(find . -type f | wc -l)
  number_of_folders=$(find . -type d | wc -l)
  echo -e "    ${CYAN}Number of folders:${NC} $number_of_folders
    ${CYAN}Number of files:${NC} $number_of_files \n\n\n" | tee -a druclinic.txt
}

# Search for some Docker related stuff.
inspecting_containers_info () {
  docker_file=$(find . -maxdepth 1  -type f -name Dockerfile |wc -l)
  docker_compose_file=$(find . -maxdepth 1  -type f -name *docker*compose* |wc -l)
  lando_file=$(find . -maxdepth 1  -type f -name *lando* |wc -l)
  ddev_folder=$(find . -maxdepth 1  -type d -name *ddev* |wc -l)
  lando_folder=$(find . -maxdepth 1  -type d -name *lando* |wc -l)
  echo -e "    ${CYAN}Existing Docker files:${NC} $docker_file
    ${CYAN}Existing Docker Compose files:${NC} $docker_compose_file
    ${CYAN}Existing Lando files:${NC} $lando_file
    ${CYAN}Existing Lando folders:${NC} $lando_folder
    ${CYAN}Existing DDEV folders:${NC} $ddev_folder \n\n\n" | tee -a druclinic.txt
  
}

# Count values from files in config folder.
counting_config_files () {
  config_path="./config/sync"
  no_config=1
  if [ -d $config_path ] 
    then
      echo -e "    ${CYAN} Info:${NC} Directory /config/sync exists." 
  else
      echo -e "    ${CYAN} Info:${NC} Directory /config/sync does not exists. Going to /files folder."
      config_path="./web/sites/default/files/sync"
      if [ ! -d $config_path ]
        then
          echo -e "    ${CYAN} Info:${NC} Directory /files/sync does not exist either."
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
      echo -e "    ${CYAN} Number of config files:${NC} $config_files
    ${CYAN} Number of content types:${NC} $content_types
    ${CYAN} Number of paragraphs:${NC} $paragraph_items
    ${CYAN} Number of existing blocks:${NC} $block_items
    ${CYAN} Number of vocabularies:${NC} $vocabulary_items
    ${CYAN} Number of existing fields:${NC} $field_items
    ${CYAN} Number of Views:${NC} $view_items
    ${CYAN} Number of User Roles:${NC} $user_roles \n\n\n" | tee -a druclinic.txt
  else
    echo -e " ${ORANGE} Warning:${NC} We could not find any configuration files, the usual addresses do not exist.\n\n"
  fi
}

# Calculating space use
calculating_space_use () {
  root_folder="./web"
  
  if [ ! -d $root_folder ]
    then
      root_folder="./root/"
      if [ ! -d $root_folder ]
        then
          root_folder="zero"
          echo -e "    ${CYAN} Info:${NC} Directory root is not available." 
      else 
        echo -e "    ${CYAN} Info:${NC} Directory root named as 'root'."
      fi
  else
     echo -e "    ${CYAN} Info:${NC} Directory root named as 'web'."
  fi
  
  if [ $root_folder != "zero" ]
    then 
      total_size=$(du -sh ./ 2> /dev/null)
      partial_size=$(du -sh ./* 2> /dev/null)
      web_size=$(du -sh $root_folder* 2> /dev/null)
      files_size=$(du -sh $root_folder/sites/default/files/ 2> /dev/null)
      echo -e "    ${CYAN} Total size:${NC} $total_size \n
    ${CYAN} Size partial by folder:${NC} 
    $partial_size \n
    ${CYAN} Size of the root folder:${NC} $web_size \n
    ${CYAN} Size of the /files folder:${NC} $files_size \n\n\n" | tee -a druclinic.txt
  else 
    echo -e "    ${ORANGE} Warning:${NC} There is no root folder available.
    The project was not yet mounted by Composer or the name differs from the usual ones.\n\n\n" 
  fi
}

###############################################################################
## Calling functions zone                                                    ##
###############################################################################

# Loading initial settings.
rm -f ./druclinic.txt
load_colors
load_messages
touch druclinic.txt
chmod 777 druclinic.txt

# Printing initial splash.
print_splash

# Main workflow of messages and operations.

# Counting number of files and folders.
## Print the first message: Files and Folders.
print_messages S1
## Count files and folders.
counting_files_and_folders
sleep 2

# Inspecting containers related information.
## Print the second message: Containers-related info.
print_messages S2
## Inspect containers related info.
inspecting_containers_info
sleep 2

# Counting Config files info.
## Print the third message: config files info.
print_messages S3
## Count config files. 
counting_config_files
sleep 2

# Counting Use of Space in disk.
## Print the fourth message: Using Space info.
print_messages S4
## Count use of space in disk for the project directory.
calculating_space_use
sleep 2

# Clean the report file deleting color codes.
sed -i -r "s/\x1B\[(([0-9]+)(;[0-9]+)*)?[m,K,H,f,J]//g" ./druclinic.txt