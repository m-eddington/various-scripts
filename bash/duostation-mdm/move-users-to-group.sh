#!/bin/bash
Domain=example.com
Username=apiuser
Password=password123
grpID="groupID=77"

# Fetch UserID in group 77 with department set to Maintenance
userID=$(curl -s https://${Domain}/api/users?$grpID --user ${Username}:${Password} | jq | grep -B 13 -- "Maintenance" | grep '"Id":' | cut -c 11-14)

# Move users to group 146
id=($userID)
for i in "${id[@]}"
do
    curl -s -X PUT https://${Domain}/api/users/$i  -H 'Content-Type: application/json' -d '{"groupId": "146"}' --user ${Username}:${Password}
done

exit 0
