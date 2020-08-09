#!/bin/bash
# author: Amir Alwash

echo '~~ Loading defaults file ~~ '
if ! test -f "$(dirname $0)/default.sh";then
   echo "The default file doesn't exist. Please copy the template. Exiting..."
   exit
else
   source $(dirname $0)/default.sh
fi
output_dir="$(dirname $0)/output"
echo '~~ Checking commands ~~'
source $(dirname $0)/includes/check_cmd.sh
echo '~~ Assigining values ~~'
for ARGUMENT in "$@"
do
   KEY=$(echo $ARGUMENT | cut -f1 -d=)
   VALUE=$(echo $ARGUMENT | cut -f2- -d=)

   case "$KEY" in
      url)                 url=${VALUE} ;;
      file)                file=${VALUE} ;;
      discord)             discord=${VALUE} ;;
      feed_title)          feed_title=${VALUE} ;;
      feed_description)    feed_description=${VALUE} ;;
      color)               color=${VALUE} ;;
      author_name)         author_name=${VALUE} ;;
      author_url)          author_url=${VALUE} ;;
      author_icon)         author_icon=${VALUE} ;;
      footer_title)        footer_title=${VALUE} ;;
      footer_icon)         footer_icon=${VALUE} ;;
      field)               field=${VALUE} ;;
      *)
   esac
done
echo '~~ Checking values ~~'
source $(dirname $0)/includes/check_val.sh
echo '~~ Curling the feed and parsing it with XML2 ~~'
out=$(curl -sL $url | xml2)
echo '~~ Further parsing output and creating feeder file ~~'
source $(dirname $0)/includes/parse.sh
echo '~~ Feeder ~~'
source $(dirname $0)/includes/feeder.sh
