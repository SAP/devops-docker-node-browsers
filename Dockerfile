# node-10 is LTS and required for sap approuter. EOL: 2021-04-01
FROM node:10-buster

RUN apt-get update && \
    apt-get install -y chromium=78.0.3904.97-1~deb10u1 firefox-esr=68.2.0esr-1~deb10u1 xvfb libxi6 libgconf-2-4 openjdk-11-jdk && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/*

RUN ln -s /usr/bin/chromium /usr/bin/google-chrome

RUN npm config set @sap:registry https://npm.sap.com --global

USER node
