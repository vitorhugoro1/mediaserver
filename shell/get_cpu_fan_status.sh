#!/bin/bash

echo $(/usr/bin/sensors -j | /usr/bin/jq --arg date $(date +%s) '. + {"time": $date}')

#Exit cleanly
exit 0