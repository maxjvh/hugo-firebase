FROM node:carbon

ENV HUGO_VERSION=0.59.1
ENV HUGO_DOWNLOAD_URL=https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz

USER node
RUN mkdir /home/node/.npm-global
ENV PATH=/home/node/.npm-global/bin:$PATH
ENV NPM_CONFIG_PREFIX=/home/node/.npm-global

RUN npm install -g firebase-tools

USER root

RUN apt-get update
RUN apt-get install -y \
    git \
    wget

RUN wget "$HUGO_DOWNLOAD_URL" && \
    tar xzf hugo_${HUGO_VERSION}_Linux-64bit.tar.gz && \
	mv hugo /usr/bin/hugo && \
    rm hugo_${HUGO_VERSION}_Linux-64bit.tar.gz LICENSE README.md


EXPOSE 1313
