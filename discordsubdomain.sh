#!/bin/bash
inst=$(date)
message="Subdomain Scan for $DOM is Completed @ $inst"
## format to parse to curl
## echo Sending message: $message

echo "$inst"
msg_content=\"$message\"

## discord webhook
url='https://discord.com/api/webhooks/821644289514799124/HDGXgevqIuHCdkZagobk3p2azThkZlkSYZjYKiy1E6MQ4wcg_eE8Hxqgy80m7CVus3k7'
curl -H "Content-Type: application/json" -X POST -d "{\"content\": $msg_content}" $url
