#!/bin/bash
# author: Amir Alwash

commands=('curl' 'xml2' 'grep' 'cut')
for i in "${commands[@]}"
do
  if ! [ -x "$(command -v "$i")" ]; then
      echo 'ERROR : Command '"$i"' not found. Please install it. Exiting...'
      exit
  else
      echo "Command found. Continuing..."
  fi
done
echo 'All commands are found. Continuing...'
