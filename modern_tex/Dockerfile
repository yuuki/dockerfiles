FROM debian:11.11
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -yq && apt-get -yq install --no-install-recommends --fix-missing \
    wget \
    git \
    make \
    cpanminus \
    pandoc \
    texlive-latex-extra \
    texlive-extra-utils \
    texlive-xetex \
    texlive-luatex \
    texlive-bibtex-extra \
    texlive-science \
    texlive-lang-cjk \
    texlive-lang-japanese \
    latex-cjk-japanese \
    fonts-noto-cjk \
    fonts-noto-cjk-extra \
    biber \
    latexmk \
    texlive-fonts-recommended \
    texlive-fonts-extra \
    texlive-font-utils \
    poppler-utils \
    poppler-data \
    lmodern \
    fonts-ipa* \
    evince \
    gsfonts-x11 \
    libxm4 \
    ghostscript \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN cpanm Log::Log4perl Log::Dispatch::File YAML::Tiny File::HomeDir Unicode::GCString

RUN tlmgr init-usertree

VOLUME /data
WORKDIR /data

