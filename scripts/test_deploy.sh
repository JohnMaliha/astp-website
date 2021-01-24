#!/bin/sh
# Test deployment of website image
set -e

IMAGE_NAME="astp/website:latest"

CONTAINER_ID=$(docker run -d -p 8080:80 $IMAGE_NAME)
echo "container ID: $CONTAINER_ID"

# Then open in a browser
google-chrome http://localhost:8080

# Wait for input, then kill
read -p "press <enter> to kill container..." dummy
docker container kill $CONTAINER_ID
