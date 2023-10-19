#!/bin/bash

# Change to src directory if running in cronjob
cd "$(dirname "$0")/..";

# Build docker container if not built yet
[ -n "$(docker images -q live:latest)" ] || docker build -t live:latest -f dockerfile .

echo "Starting server..."

docker run --rm -p 1935:1935 -p 8080:8080 live:latest