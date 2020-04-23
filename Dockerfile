# node-10 is LTS and required for sap approuter. EOL: 2021-04-01
FROM node:10-buster

RUN apt-get update && \
    apt-get install -y chromium=80.0.3987.162-1~deb10u1 libgbm1 firefox-esr=68.7.0esr-1~deb10u1 xvfb libxi6 libgconf-2-4 openjdk-11-jre && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/* && \
    ln -s /usr/bin/chromium /usr/bin/google-chrome && \
    npm config set @sap:registry https://npm.sap.com --global

# Workaround for https://npm.sap.com issue with open SSL in Debian Buster
RUN CIPHERS="$(openssl ciphers)" && sed -i "s/DEFAULT@SECLEVEL=2/$CIPHERS:DH-RSA-AES256-SHA256/g" /etc/ssl/openssl.cnf

USER node
