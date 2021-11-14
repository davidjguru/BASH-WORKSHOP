#!/usr/bin/env bash

if [[ ! -z $1  &&  ! -z $2 ]] && [[ ${#1} != ${#2} ]] 
  then
   echo "strands must be of equal length" && exit 1
elif [[ -z $1  &&  -z $2 ]]
  then
    echo "0" && exit 0 
fi
