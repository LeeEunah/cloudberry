#!/bin/bash -
#===============================================================================
#
#          FILE: geotag.sh
#
#         USAGE: ./geotag.sh < read stdin > write stdout
#
#   DESCRIPTION:
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Jianfeng Jia (), jianfeng.jia@gmail.com
#  ORGANIZATION: ics.uci.edu
#       CREATED: 04/17/2016 01:06:30 PM PDT
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

thread=${1:-1}
sbt -mem 2048 "project noah" --error 'set showSuccess := false'  "run-main edu.uci.ics.cloudberry.noah.TwitterJSONTagToADM\
    -state ./web/twittermap/public/data/state.json\
    -county ./web/twittermap/public/data/county.json \
    -city ./web/twittermap/public/data/city.json \
    -thread $thread"
