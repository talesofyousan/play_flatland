#!/bin/bash

GPU=0
IMAGE=kikuchi_flatland_evaluation
ID=${IMAGE}-${USER//[^a-zA-Z0-9]/}
# IMAGE=gpu-registry:5000/yutaro.kikuchi/tensorflow-gpu-py3-jupyter
MEMORY=8g
IPADDR=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')

WORKDIR=$(cd ..; pwd)
echo $WORKDIR
docker run \
  --rm \
  --hostname=$ID \
  --memory=$MEMORY \
  --name=$ID \
  --publish-all \
  -e DISPLAY="${IPADDR}:0" \
  -it \
  --volume $WORKDIR:/workspace \
  $IMAGE /bin/bash
