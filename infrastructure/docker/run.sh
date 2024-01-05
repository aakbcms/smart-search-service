#!/bin/sh

# Exit when any command fails
set -e
set -x

APP_VERSION=develop
VERSION=latest

docker build --no-cache --build-arg APP_VERSION=${APP_VERSION} --tag=itkdev/smart-search-service:${VERSION} --file="smart-search-service/Dockerfile" smart-search-service
docker push itkdev/smart-search-service:${VERSION}

docker build --no-cache --build-arg VERSION=${VERSION} --tag=itkdev/smart-search-service-nginx:${VERSION} --file="nginx/Dockerfile" nginx
docker push itkdev/smart-search-service-nginx:${VERSION}
