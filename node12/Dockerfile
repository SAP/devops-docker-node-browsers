FROM node:12-buster

RUN apt-get update && \
    apt-get install -y chromium=78.0.3904.108-1~deb10u1 firefox-esr=68.2.0esr-1~deb10u1 xvfb libxi6 libgconf-2-4 openjdk-11-jre && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/*

RUN ln -s /usr/bin/chromium /usr/bin/google-chrome

RUN npm config set @sap:registry https://npm.sap.com --global

# Workaround for https://npm.sap.com issue with open SSL in Debian Buster
RUN CIPHERS="$(openssl ciphers)" && sed -i "s/DEFAULT@SECLEVEL=2/$CIPHERS:DH-RSA-AES256-SHA256/g" /etc/ssl/openssl.cnf

USER node
