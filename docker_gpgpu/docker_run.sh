#!/bin/bash

GPU=0
ID=$(hostname)-${GPU//,/}-${USER//[^a-zA-Z0-9]/}
IMAGE=gpu-registry:5000/yutaro.kikuchi/kikuchi_flatland
# IMAGE=gpu-registry:5000/yutaro.kikuchi/tensorflow-gpu-py3-jupyter
MEMORY=32g

docker run \
  --detach \
  --env NVIDIA_VISIBLE_DEVICES=$GPU \
  --hostname=$ID \
  --memory=$MEMORY \
  --name=$ID \
  --publish-all \
  --rm \
  --volume /home:/home \
  $IMAGE

PORT=$(docker port $ID | grep 22/tcp | awk -F: '{print $2}')
echo ssh $USER@$(hostname) -p $PORT

