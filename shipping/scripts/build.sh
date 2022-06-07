#!/usr/bin/env bash

set -ev

export BUILD_VERSION="0.0.2-SNAPSHOT"
export BUILD_DATE=`date +%Y-%m-%dT%T%z`

SCRIPT_DIR=$(dirname "$0")
DOCKER_CMD=docker

CODE_DIR=$(cd $SCRIPT_DIR/..; pwd)
echo $CODE_DIR
#mvn -DskipTests package

cp $CODE_DIR/target/*.jar $CODE_DIR/docker/shipping

for m in ./docker/*/; do
    $DOCKER_CMD build \
      --build-arg BUILD_VERSION=$BUILD_VERSION \
      --build-arg BUILD_DATE=$BUILD_DATE \
      --build-arg COMMIT=$COMMIT \
      -t nofreewilly/shipping:v1.1 $CODE_DIR/$m;
done;
