#!/bin/bash -ex

TAG=${1:-.}
JAVA_VERSION=${2}

echo Testing version $TAG

docker build --build-arg=BASE_IMAGE_TAG=${TAG} --build-arg=JAVA_VERSION=${JAVA_VERSION} -t localhost:5000/ppiper/node-browsers:${TAG} .

docker run --rm localhost:5000/ppiper/node-browsers:${TAG} chromium --version
docker run --rm localhost:5000/ppiper/node-browsers:${TAG} firefox --version
docker run --rm localhost:5000/ppiper/node-browsers:${TAG} java -version
docker run --rm localhost:5000/ppiper/node-browsers:${TAG} node --version
docker run --rm localhost:5000/ppiper/node-browsers:${TAG} cat /etc/os-release