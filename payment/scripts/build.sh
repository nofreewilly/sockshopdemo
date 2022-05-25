#!/usr/bin/env bash

set -ev

SCRIPT_DIR=$(dirname "$0")
DOCKER_CMD=docker
CODE_DIR=$(cd $SCRIPT_DIR/..; pwd)
echo $CODE_DIR

cp -r $CODE_DIR/cmd/ $CODE_DIR/docker/payment/cmd/
cp $CODE_DIR/*.go $CODE_DIR/docker/payment/
mkdir $CODE_DIR/docker/payment/vendor && cp $CODE_DIR/vendor/manifest $CODE_DIR/docker/payment/vendor/

REPO=nofreewilly/payment;

$DOCKER_CMD build -t ${REPO}-dev -f $CODE_DIR/docker/payment/Dockerfile $CODE_DIR/docker/payment;
$DOCKER_CMD create --name payment ${REPO}-dev;
$DOCKER_CMD cp payment:/app $CODE_DIR/docker/payment/app;
$DOCKER_CMD rm payment;
$DOCKER_CMD build -t ${REPO}:v1.0 -f $CODE_DIR/docker/payment/Dockerfile-release $CODE_DIR/docker/payment;
