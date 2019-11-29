
IMAGE=kikuchi_flatland
VERSION=latest

echo $IMAGE

docker build -t gpu-registry:5000/$USER/$IMAGE:$VERSION .