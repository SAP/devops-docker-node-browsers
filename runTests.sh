#!/bin/bash -ex

# Start a local registry, to which we push the images built in this test, and from which they will be consumed in the test
docker run -d -p 5000:5000 --restart always --name registry registry:2 || true

docker build -t localhost:5000/ppiper/node-browsers:latest .
docker tag localhost:5000/ppiper/node-browsers:latest ppiper/node-browsers:latest
docker push localhost:5000/ppiper/node-browsers:latest

git clone https://github.com/piper-validation/cloud-s4-sdk-book.git -b validate-node-browsers test-project
pushd test-project

docker run -v //var/run/docker.sock:/var/run/docker.sock -v $(pwd):/workspace -v /tmp \
 -e BRANCH_NAME=master \
 -e CASC_JENKINS_CONFIG=/workspace/jenkins.yml -e HOST=$(hostname) \
 ppiper/jenkinsfile-runner

popd

function cleanup {
  rm -rf test-project
}
trap cleanup EXIT

