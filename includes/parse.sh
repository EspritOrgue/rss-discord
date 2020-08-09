#!/bin/bash
# author: Amir Alwash

## delimiter
oldIFS="$IFS"
IFS='
'
IFS=${IFS:0:1}
## array output
lines=( $out )
IFS="$oldIFS"
# Loop the items of the parsed feed
for line in "${lines[@]}"
   do
      title=$(echo $line | grep "item" | grep "title" | cut -d "=" -f2-)
      if [ -z "$title" ];then
         link=$(echo $line | grep "item" | grep "link" | cut -d "=" -f2-)
         if [ -z "$link" ];then
            echo "Not a Title or a Link."
         else
            echo $link >> $file".tmp"
            echo $link >> $file
         fi
      else
         if grep -qF "$title" $file;then
            echo "Old item found. Stopping watching the items..."
            break
         else
            echo "New item"
            echo $title >> $file".tmp"
            echo $title >> $file
         fi
      fi
      #echo "--> $link"
done
