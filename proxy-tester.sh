#!/bin/bash
#Changed the script so to be more accurate so 302 etc dont slipp by aswell added green colored text in stdout if proxy is working.

echo_colored() {
    local color_code=$1
    shift
    local text=$@
    echo -e "\e[${color_code}m${text}\e[0m"
}

GREEN="32"

proxies=(
    "http://154.12.242.82:8888"
    "http://116.68.194.61:1080"
    "http://62.109.31.192:20000"
    "http://89.187.191.112:8888"
    "http://13.208.56.180:80"
    "http://152.26.231.22:9443"
    "http://136.226.230.118:10230"
    "http://136.226.233.31:10230"
    "http://190.158.210.102:8080"
        #proxies go here..
)

check_proxy() {
    local proxy=$1
    if curl -x "$proxy" -s --head http://www.google.com/ | grep "200 OK" > /dev/null; then
        echo_colored $GREEN "Proxy $proxy is working"
    else
        echo "Proxy $proxy is not working"
    fi
}

for proxy in "${proxies[@]}"; do
    check_proxy "$proxy"
done
