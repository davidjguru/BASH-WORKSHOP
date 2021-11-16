#!/usr/bin/env bash

if [[ $# -lt 2 ]] 
  then 
    echo "Usage: hamming.sh <string1> <string2>" && exit 1
elif [[ "${#1}" != "${#2}" ]] 
  then
   echo "strands must be of equal length" && exit 1

fi
counter=0
for (( c=0; c<${#1}; c++ ))
  do  
    one=${1:${c}:1}
    two=${2:${c}:1}
    if [ "${one}" != "${two}" ]
      then
        ((counter++))
    fi
  done
echo $counter && exit 0