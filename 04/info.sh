#!/bin/bash

function ip_info {
    echo "$(shuf -i 1-255 -n 1).$(shuf -i 1-255 -n 1).$(shuf -i 1-255 -n 1).$(shuf -i 1-255 -n 1)"
}

function status_info {
    status=("200" "201" "400" "401" "403" "404" "500" "501" "502" "503")
    shuf -e ${status[*]} -n 1
}

#HTTP STATUS CODE:
#200 OK
#201 Created
#400 Bad Request
#401 Unauthorized
#403 Forbidden
#404 Not Found
#500 Internal Server Error
#5O1 Not Implemented
#502 Bad Gateway
#5O3 Service Unavailable

function method_info {
    method=("GET" "POST" "PUT" "PATCH" "DELETE")
    protocol=("HTTP/1.0" "HTTP/2" "HTTP/3")
    echo "$(shuf -e ${method[*]} -n 1) / $(shuf -e ${protocol[*]} -n 1)"
}

function url_info {
    url=("/home" "/images" "/documents" "/reports" "/test")
    shuf -e ${url[*]} -n 1
}

function agent_info {
    agent=('Mozilla' 'Google Chrome' 'Opera' 'Safari' 'Internet Explorer' 'Microsoft Edge' 'Crawler and bot' 'Library and net tool')
    echo "${agent[RANDOM % ${#agent[*]}]}"
}

function user_name {
    name="user"
    x=$RANDOM
    echo $name$x
}