# Node Browsers Image

[![REUSE status](https://api.reuse.software/badge/github.com/SAP/devops-docker-node-browsers)](https://api.reuse.software/info/github.com/SAP/devops-docker-node-browsers)

> **⚠️ Important Notice:** The GitHub Container Registry (ghcr.io) for this project is no longer being updated. Please use the Docker Hub registry instead: `docker pull ppiper/node-browsers`

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

The default tag `latest` contains Node 24.

For specific Node versions, use the following tags:

```
docker pull ppiper/node-browsers:20-bookworm
docker pull ppiper/node-browsers:22-bookworm
docker pull ppiper/node-browsers:24-bookworm
```

## Build

To build this image locally, open a terminal in the directory of the Dockerfile and run

```
docker build --build-arg=BASE_IMAGE_TAG=24-bookworm -t ppiper/node-browsers .
```

Where the `BASE_IMAGE_TAG` can be set to `20-bookworm`, `22-bookworm`, or `24-bookworm`.
The given tag **must** exist in the [node](https://hub.docker.com/_/node) base image **and** use Debian GNU/Linux.

## Usage

See this [blog post](https://blogs.sap.com/2017/12/11/sap-s4hana-cloud-sdk-end-to-end-tests-against-secured-applications/) for usage of this image in a Jenkins pipeline based on `ppiper/jenkins-master`.

## Licensing

Copyright 2017-2021 SAP SE or an SAP affiliate company and devops-docker-node-browsers contributors. Please see our [LICENSE](LICENSE) for copyright and license information. Detailed information including third-party components and their licensing/copyright information is available [via the REUSE tool](https://api.reuse.software/info/github.com/SAP/devops-docker-node-browsers).
