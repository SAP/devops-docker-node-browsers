# Node Browsers Image

This [_Dockerfile_](https://docs.docker.com/engine/reference/builder/) can be used in _Continuous Delivery_ (CD) pipelines for SAP development projects.
The image is optimized for use with project ["Piper"](https://github.com/SAP/jenkins-library) on [Jenkins](https://jenkins.io/).
Docker containers simplify your CD tool setup, encapsulating tools and environments that are required to execute pipeline steps.

If you want to learn how to use project "Piper" please have a look at [the documentation](https://github.com/SAP/jenkins-library/blob/master/README.md).
Introductory material and a lot of SAP scenarios not covered by project "Piper" are described in our [Continuous Integration Best Practices](https://developers.sap.com/tutorials/ci-best-practices-intro.html).

## About this repository

Dockerfile for an image with node and web browsers.
This image is intended to be used for end to end tests of web applications in Jenkins pipelines.

## Download

This image is published to Docker Hub and can be pulled via the command

```
docker pull ppiper/node-browsers
```

The default tag contains node 10 due to compatibility reasons with approuter.

For node 12, use the tag `node12`:

```
docker pull ppiper/node-browsers:node12
```

## Build

To build this image locally, open a terminal in the directory of the Dockerfile and run

```
docker build -t ppiper/node-browsers .
```

## Usage

See this [blog post](https://blogs.sap.com/2017/12/11/sap-s4hana-cloud-sdk-end-to-end-tests-against-secured-applications/) for usage of this image in a Jenkins pipeline based on `ppiper/jenkins-master`.
