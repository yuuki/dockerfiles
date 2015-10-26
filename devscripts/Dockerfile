FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -yq && \ 
    apt-get install -yq --force-yes --no-install-recommends curl devscripts && \
    apt-get clean && \
    rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

RUN mkdir -p /work
WORKDIR /work
