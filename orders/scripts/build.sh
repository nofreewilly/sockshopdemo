#!/usr/bin/env bash

IMAGE=orders

set -ev

SCRIPT_DIR=$(dirname "$0")
DOCKER_CMD=docker
CODE_DIR=$(cd $SCRIPT_DIR/..; pwd)
echo $CODE_DIR
# Fehler in Zeile 14: Error response from daemon: the working directory
# 'C:/Program Files/Git/usr/src/mymaven' is invalid, it needs to be an absolute path.
# Maven config bereits auf .../orders eingestellt und ausgeführt, trotzdem der Fehler
#mvn -q -DskipTests package

cp -r $CODE_DIR/docker $CODE_DIR/target/docker/
cp -r $CODE_DIR/target/*.jar $CODE_DIR/target/docker/orders

$DOCKER_CMD build -t nofreewilly/orders:v1.0 $CODE_DIR/target/docker/orders;
