FROM debian:wheezy
MAINTAINER y_uuki

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -yq && \
    apt-get install -yq --no-install-recommends build-essential curl ca-certificates tar bzip2 patch && \
    apt-get clean && \
    rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

ENV PERL_VERSION 5.14.2
ENV PATH /opt/perl-$PERL_VERSION/bin:$PATH
ENV PERL_CARTON_PATH /cpan

# Perl
RUN curl -sL https://raw.githubusercontent.com/tokuhirom/Perl-Build/master/perl-build > /usr/bin/perl-build
RUN perl -pi -e 's%^#!/usr/bin/env perl%#!/usr/bin/perl%g' /usr/bin/perl-build
RUN chmod +x /usr/bin/perl-build
RUN perl-build $PERL_VERSION /opt/perl-$PERL_VERSION
RUN curl -sL http://cpanmin.us/ | /opt/perl-$PERL_VERSION/bin/perl - --notest App::cpanminus Carton

