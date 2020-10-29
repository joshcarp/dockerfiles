FROM alpine:latest

RUN apk add --no-cache \
    curl \
    git \
    openssh-client \
    rsync \
    bash

RUN curl https://install.joshcarp.com/gohugoio/hugo@v0.76.5!

WORKDIR /src

EXPOSE 1313
