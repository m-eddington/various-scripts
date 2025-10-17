#!/bin/bash
SN=${1}
deviceId=$(gam print cros query "id:${SN}" 2>/dev/null | awk -v RS=" " '/deviceId/{getline;print ""$0}' | awk 'NR>1{print $1;}')
gam info cros $deviceId | sed '24,$d'
exit 0
