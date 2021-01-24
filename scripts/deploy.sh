#!/bin/sh
# Deploy to Docker registry
set -e

IMAGE_NAME="astp/website:latest"

# Build image and tag with private registry
docker build -t $IMAGE_NAME .
docker tag $IMAGE_NAME registry.step.polymtl.ca/$IMAGE_NAME

# Login
docker login https://registry.step.polymtl.ca/

# Push
docker push registry.step.polymtl.ca/$IMAGE_NAME
