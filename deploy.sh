#!/bin/bash
SETTINGS_TIMESTAMP=$(date +%s)  docker stack deploy -c docker-stack.yml blue-green