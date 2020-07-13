ARG BASE_IMAGE

FROM $BASE_IMAGE

RUN apt-get update && \
    apt-get install -y chromium firefox-esr xvfb libxi6 libgbm1 libgconf-2-4 openjdk-11-jre && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/* && \
    ln -s /usr/bin/chromium /usr/bin/google-chrome && \
    npm config set @sap:registry https://npm.sap.com --global

# Workaround for https://npm.sap.com issue with open SSL in Debian Buster
RUN CIPHERS="$(openssl ciphers)" && sed -i "s/DEFAULT@SECLEVEL=2/$CIPHERS:DH-RSA-AES256-SHA256/g" /etc/ssl/openssl.cnf

USER node
