ARG BASE_IMAGE_TAG

FROM node:$BASE_IMAGE_TAG

ARG JAVA_VERSION

RUN DEBIAN_VERSION=$(. /etc/os-release && echo "$VERSION_CODENAME") && \
    if [ "$DEBIAN_VERSION" != "trixie" ]; then EXTRAS="libgconf-2-4"; fi && \
    apt-get update && \
    apt-get install -y chromium firefox-esr xvfb libxi6 libgbm1 $EXTRAS openjdk-"${JAVA_VERSION}"-jre && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/* && \
    ln -s /usr/bin/chromium /usr/bin/google-chrome

USER node
