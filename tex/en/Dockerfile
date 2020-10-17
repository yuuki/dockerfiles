FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

RUN sed -i -e 's%http://[^ ]\+%mirror://mirrors.ubuntu.com/mirrors.txt%g' /etc/apt/sources.list

RUN apt-get update -yq && \
  apt-get -yq install --no-install-recommends --fix-missing \
  wget \
  git \
  make \
  cpanminus \
  pandoc \
  texlive-latex-extra \
  texlive-extra-utils \
  texlive-bibtex-extra \
  biber \
  latexmk \
  texlive-fonts-recommended \
  texlive-fonts-extra \
  fonts-noto-cjk \
  fonts-noto-cjk-extra \
  poppler-utils \
  poppler-data \
  lmodern \
  fonts-ipa* \
  ghostscript && \
  apt-get clean && rm -rf /var/lib/apt/lists/* 

RUN cpanm Log::Log4perl Log::Dispatch::File YAML::Tiny File::HomeDir Unicode::GCString

ENV LANGUAGE=en_US.UTF-8 LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8

VOLUME /data
WORKDIR /data
