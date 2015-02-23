FROM debian:wheezy
MAINTAINER y_uuki

ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb http://cdn.debian.net/debian/ wheezy main contrib non-free" > /etc/apt/sources.list.d/mirror.jp.list
RUN echo "deb http://cdn.debian.net/debian/ wheezy-updates main contrib" >> /etc/apt/sources.list.d/mirror.jp.list
RUN rm /etc/apt/sources.list

RUN apt-get -y update && apt-get -yq --no-install-recommends --force-yes install libc6=2.13-38+deb7u6 libc-bin=2.13-38+deb7u6 libc6-dev 
RUN apt-get -y update && \
    apt-get -yq --no-install-recommends install curl ca-certificates tar git build-essential && \
    apt-get clean && \
    rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

ENV GOPATH /go
ENV GOROOT /opt/local/go
ENV PATH $PATH:/opt/local/go/bin:/go/bin
ENV GOOS linux
ENV GOARCH amd64

RUN mkdir -p /opt/local
RUN curl -L https://storage.googleapis.com/golang/go1.3.3.linux-amd64.tar.gz -o /tmp/go.tar.gz
RUN tar -C /opt/local -xzf /tmp/go.tar.gz
RUN (cd /opt/local/go/src; ./make.bash --no-clean)
