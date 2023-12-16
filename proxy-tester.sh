#!/bin/bash

while IFS= read -r line; do
    echo -n "$line: "
    if curl -sS --connect-timeout 5 -x "$line:80" http://www.example.com -o /dev/null; then #can br any domain to test connection to
        echo "Active"
    else
        echo "Inactive"
    fi
done < "proxies.txt"
