#!/usr/bin/env bash

set -ev

SCRIPT_DIR=$(dirname "$0")

 DOCKER_CMD=docker

CODE_DIR=$(cd $SCRIPT_DIR/..; pwd)
echo $CODE_DIR

$DOCKER_CMD build -t nofreewilly/front-end:v1.0 $CODE_DIR

