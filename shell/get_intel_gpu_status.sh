#!/bin/bash

#This is so messy...

#Beat intel_gpu_top into submission
JSON=$(/usr/bin/timeout -k 3 3 sudo /usr/bin/intel_gpu_top -J)
VIDEO_UTIL=$(echo "$JSON"|grep busy|sort|tail -1|cut -d ":" -f2|cut -d "," -f1|cut -d " " -f2)


#Spit out something telegraf can work with
echo "[{\"time\": `date +%s`, \"intel_gpu_util\": "$VIDEO_UTIL"}]"

#Exit cleanly
exit 0