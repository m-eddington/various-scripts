#!/bin/bash
Domain=example.com
Username=apiuser
Password=password123
SN=${1}
VAR2=${2}

# Get device Id from serialnumber
IDnr=$(curl https://${Domain}/api/devices?serialNumber=${SN} --user ${Username}:${Password} 2>/dev/null | awk -F '"Id":' '{print substr($2,2,36)}')

# Send message to device with device id gotten from previous step
curl -X POST https://${Domain}/api/devices/${IDnr}/sendmessage  -H 'Content-Type: application/json' -d '{"message": "'"${VAR2}"'"}' --user ${Username}:${Password}

exit 0
