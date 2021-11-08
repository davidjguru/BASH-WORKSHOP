#!/usr/bin/env bash

if [ $# == 1 ]
  then 
    person=$1
    echo "Hello, $person"
    exit 0
else 
  echo "Usage: error_handling.sh <person>"
  exit 1
fi

