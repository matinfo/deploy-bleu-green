#!/bin/bash
ENVIRONMENT=$1
CONF=./nginx/loadbalancer/conf.d/default.conf

if [[ "$ENVIRONMENT" == "blue" ]]; then
    sed -i 's/proxy_pass http:\/\/green;/proxy_pass http:\/\/blue;/' $CONF
elif [[ "$ENVIRONMENT" == "green" ]]; then
    sed -i 's/proxy_pass http:\/\/blue;/proxy_pass http:\/\/green;/' $CONF
else
    echo "Usage: $0 [blue|green]"
    exit 1
fi

SETTINGS_TIMESTAMP=$(date +%s)  docker stack deploy -c docker-stack.yml blue-green

#docker-compose restart loadbalancer

