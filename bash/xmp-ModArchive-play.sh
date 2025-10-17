#!/bin/bash
echo "Playback will begin shortly: Randomizing tracks.."

OUTPUT1=$(find Music/mod/ | shuf -n 15)
OUTPUT2=$(find Music/xm/ | shuf -n 15)
OUTPUT3=$(find Music/s3m/ | shuf -n 5)
OUTPUT4=$(find Music/it/ | shuf -n 5)
OUTPUT5=$(find Music/*.zip | shuf -n 2)

xmp -R $OUTPUT1 $OUTPUT2 $OUTPUT3 $OUTPUT4 $OUTPUT5
