#!/bin/bash

# Tentukan variabel
IMAGE_NAME="item-app"
TAG="v1"
GITHUB_USERNAME="gloanda"
REPO_NAME="a433-microservices"
PACKAGE_NAME="$GITHUB_USERNAME/$REPO_NAME/$IMAGE_NAME"

# Build Docker image
echo "Building Docker image..."
docker build -t $IMAGE_NAME:$TAG .

# Lihat daftar image di lokal
echo "Listing local Docker images..."
docker images

# Mengubah nama image agar sesuai dengan format GitHub Packages
echo "Tagging Docker image..."
docker tag $IMAGE_NAME:$TAG ghcr.io/$PACKAGE_NAME:$TAG

# Login ke GitHub Packages
echo "Logging in to GitHub Packages..."
echo $GITHUB_TOKEN | docker login ghcr.io -u $GITHUB_USERNAME --password-stdin

# Mengunggah image ke GitHub Packages
echo "Pushing Docker image to GitHub Packages..."
docker push ghcr.io/$PACKAGE_NAME:$TAG

echo "Docker image pushed successfully to GitHub Packages: ghcr.io/$PACKAGE_NAME:$TAG"

