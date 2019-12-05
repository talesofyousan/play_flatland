
IMAGE=kikuchi_flatland_evaluation
VERSION=latest

echo $IMAGE

docker build -t $IMAGE:$VERSION .