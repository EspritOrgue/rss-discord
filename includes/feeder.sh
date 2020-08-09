#!/bin/bash
# author: Amir Alwash

feeder_file=$file".tmp"
COUNT=0
tac $feeder_file | while IFS= read -r line
do
   if expr $COUNT % 2 == 0; then
      feeder_url=$line
   else
      feeder_title=$line
      # echo '{"embeds": [{"title":"'"$feed_title"'","description": "'"$description"' **'"$feeder_title"'**","color": '"$color"',"footer": {"icon_url":"'"$footer_icon"'","text": "'"$footer_title"'"},"author": {"icon_url":"'"$author_icon"'","name": "'"$author_name"'","url": "'"$author_url"'"},"fields": [{"name": "'"$field"'","value": "'"$feeder_url"'"}]}]}'
      curl -X POST\
      -H "Content-Type: application/json"\
      -d '{"embeds": [{"title":"'"$feed_title"'","description": "'"$description"' **'"$feeder_title"'**","color": '"$color"',"footer": {"icon_url":"'"$footer_icon"'","text": "'"$footer_title"'"},"author": {"icon_url":"'"$author_icon"'","name": "'"$author_name"'","url": "'"$author_url"'"},"fields": [{"name": "'"$field"'","value": "'"$feeder_url"'"}]}]}' $discord
      sleep 2
   fi
   echo "$COUNT $line"
   COUNT=$(( $COUNT + 1 ))
done
rm $feeder_file
