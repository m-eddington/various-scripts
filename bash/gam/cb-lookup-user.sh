#!/bin/bash
SN=${1}
deviceId=$(gam print cros query "recent_user:${SN}" 2>/dev/null | awk 'f;/deviceId/{f=1}')
getSN=($deviceId)
for f in "${getSN[@]}"
do
gam info cros "$f" | sed '24,$d' | grep 'serialNumber'
done

exit 0
