#!/bin/bash
#---------------------------------------------------------#
# https://rainymood.com
#---------------------------------------------------------#
# Set the playback volume 1-100%
    VOL=80

    LINK1="https://media.rainymood.com/0.m4a"

#---------------------------------------------------------#
mpv --no-terminal --gapless-audio=yes --no-ytdl --volume="$VOL" "$LINK1"
exit 0
