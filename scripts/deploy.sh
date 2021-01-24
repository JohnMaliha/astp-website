#!/bin/sh
# Deploy to Docker registry
#   If the --ci option is used, Docker username and password must
#   be provided through the following environment variables:
#       DOCKER_USERNAME
#       DOCKER_PASSWORD
set -e

ci=0
if [ "$1" = "--ci" ]
then
    ci=1
    if [ -z "$DOCKER_USERNAME" ] || [ -z "$DOCKER_PASSWORD" ]
    then
        echo "Environment variables must be set with --ci option: DOCKER_USERNAME, DOCKER_PASSWORD"
        exit 1
    fi
fi

IMAGE_NAME="astp/website:latest"

# Build image and tag with private registry
docker build -t $IMAGE_NAME .
docker tag $IMAGE_NAME registry.step.polymtl.ca/$IMAGE_NAME

# Login
if [ "${ci}" -eq 1 ]
then
    docker login -u "$DOCKER_USERNAME" -p "$DOCKER_PASSWORD" https://registry.step.polymtl.ca/
else
    docker login https://registry.step.polymtl.ca/
fi


# Push
docker push registry.step.polymtl.ca/$IMAGE_NAME
