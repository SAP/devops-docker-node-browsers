#!/bin/bash -ex

TAG=${1:-.}

echo Testing version $TAG

docker build --build-arg=BASE_IMAGE_TAG=${TAG} -t localhost:5000/ppiper/node-browsers:${TAG} .

docker run --rm localhost:5000/ppiper/node-browsers:${TAG} chromium --version
docker run --rm localhost:5000/ppiper/node-browsers:${TAG} firefox --version
docker run --rm localhost:5000/ppiper/node-browsers:${TAG} java -version
docker run --rm localhost:5000/ppiper/node-browsers:${TAG} node --version
docker run --rm localhost:5000/ppiper/node-browsers:${TAG} cat /etc/os-release