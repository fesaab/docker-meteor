#!/bin/bash
APP_NAME=$1
VERSION=$2
BUILD_DIR=../.$APP_NAME-build
DOCKER_TAG=saab/$APP_NAME

if [ -z "$VERSION" ]; then
  echo 'Missing version number. Ex. 1.0.0'
  exit 0
elif [ -z "$APP_NAME" ]; then
  echo 'Missing app name. Ex. saab-tools'
  exit 0
fi

rm -rf $BUILD_DIR

echo "Building Meteor bundle to $BUILD_DIR"
# Running on WINDOWS, so using meteor.bat...
meteor.bat build --architecture=os.linux.x86_64 --directory $BUILD_DIR

cp package.json $BUILD_DIR/bundle/
cp Dockerfile $BUILD_DIR/bundle/
cp .dockerignore $BUILD_DIR/bundle/
cd $BUILD_DIR/bundle/

echo "Building Dockerfile..."
docker build -t ${DOCKER_TAG}:${VERSION} .
