#!/bin/bash

# Tentukan variabel
IMAGE_NAME="shipping"
TAG="latest"
GITHUB_USERNAME="gloanda"
REPO_NAME="a433-microservices"
PACKAGE_NAME="$GITHUB_USERNAME/$REPO_NAME/$IMAGE_NAME"

# Build Docker image
echo "Building Docker image..."
docker build -t ghcr.io/$PACKAGE_NAME:$TAG .

# Login ke GitHub Packages
echo "Logging in to GitHub Packages..."
echo $GITHUB_TOKEN | docker login ghcr.io -u $GITHUB_USERNAME --password-stdin       

# Push image ke GitHub Packages
echo "Pushing Docker image to GitHub Packages..."
docker push ghcr.io/$PACKAGE_NAME:$TAG

echo "Docker image pushed successfully to GitHub Packages: ghcr.io/$PACKAGE_NAME:$TAG"