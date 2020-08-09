#!/bin/bash
# author: Amir Alwash

if [ -z "$url" ];then
   echo 'No url specified. Exiting...'
   exit
fi

if [ -z "$file" ];then
   echo 'No file path specified. Exiting...'
   exit
fi

if [ -z "$discord" ];then
   echo 'No discord webhook url specified. Exiting...'
   exit
fi

if [ -z "$feed_title" ];then
   echo 'No feed title specified. Using defaults...'
   feed_title=$default_feed_title
fi

if [ -z "$feed_description" ];then
   echo 'No ... specified. Using defaults...'
   feed_description=$default_feed_description
fi

if [ -z "$color" ];then
   echo 'No ... specified. Using defaults...'
   color=$default_color
fi

if [ -z "$author_name" ];then
   echo 'No ... specified. Using defaults...'
   author_name=$default_author_name
fi

if [ -z "$author_url" ];then
   echo 'No ... specified. Using defaults...'
   author_url=$default_author_url
fi

if [ -z "$author_icon" ];then
   echo 'No ... specified. Using defaults...'
   author_icon=$default_author_icon
fi

if [ -z "$footer_title" ];then
   echo 'No ... specified. Using defaults...'
   footer_title=$default_footer_title
fi

if [ -z "$footer_icon" ];then
   echo 'No ... specified. Using defaults...'
   footer_icon=$default_footer_icon
fi

if [ -z "$field" ];then
   echo 'No ... specified. Using defaults...'
   field=$default_field
fi
