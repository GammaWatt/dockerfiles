FROM node:14-alpine

# My Gatsby project will literally not install without these...
USER root
RUN apk add --update --no-cache \
    git \
    python3 py-pip
RUN apk add --update --no-cache gcc
RUN apk add --update --no-cache make
RUN apk add --update --no-cache musl-dev
RUN apk add --update --no-cache g++
RUN apk add --update --no-cache openssh

USER node