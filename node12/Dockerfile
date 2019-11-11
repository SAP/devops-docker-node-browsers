FROM node:12-stretch

RUN apt-get install software-properties-common && \
    apt-get update && \
    add-apt-repository ppa:openjdk-r/ppa && \
    apt-get install -y chromium firefox-esr xvfb libxi6 libgconf-2-4 openjdk-11-jdk && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/*

RUN ln -s /usr/bin/chromium /usr/bin/google-chrome

RUN npm config set @sap:registry https://npm.sap.com --global

USER node
