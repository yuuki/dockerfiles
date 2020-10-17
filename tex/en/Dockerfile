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
  poppler-utils \
  poppler-data \
  lmodern \
  fonts-ipa* \
  ghostscript && \
  apt-get clean && rm -rf /var/lib/apt/lists/* 

RUN cpanm Log::Log4perl Log::Dispatch::File YAML::Tiny File::HomeDir Unicode::GCString

RUN apt-get update && apt-get install -y --no-install-recommends --fix-missing \
  evince \
  gsfonts-x11 \
  libxm4 \
  && apt-get clean && rm -rf /var/lib/apt/lists/* 

RUN wget http://launchpadlibrarian.net/461977749/libpoppler90_0.80.0-0ubuntu1.1_amd64.deb -O /tmp/libpoppler90.deb \
    && dpkg -i /tmp/libpoppler90.deb \
    && rm -f /tmp/*.deb
RUN wget http://launchpadlibrarian.net/439337932/xpdf_3.04-13ubuntu4_amd64.deb -O /tmp/xpdf_3.04.deb \
    && dpkg -i /tmp/xpdf_3.04.deb \
    && rm -f /tmp/*.deb

VOLUME /data
WORKDIR /data
