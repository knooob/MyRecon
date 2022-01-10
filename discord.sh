#!/bin/bash
inst=$(date)
message="Directory Enum Scan for $DOM is Completed @ $inst"
## format to parse to curl
## echo Sending message: $message

echo "$inst"
msg_content=\"$message\"

## discord webhook
url='Enter webhook here'
curl -H "Content-Type: application/json" -X POST -d "{\"content\": $msg_content}" $url
