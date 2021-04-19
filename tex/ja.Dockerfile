FROM yuuki/ubuntu-texlive-en

RUN apt-get update -yq && apt-get -yq install --no-install-recommends --fix-missing \
    texlive-lang-japanese \
    language-pack-ja \
    fonts-noto-cjk \
    fonts-noto-cjk-extra \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN tlmgr init-usertree

# PDF Font setting
# https://texwiki.texjp.org/?TeX%E3%81%A8%E3%83%95%E3%82%A9%E3%83%B3%E3%83%88#ge692ee0
RUN kanji-config-updmap-sys ipaex

# Install xpdf
RUN wget https://dl.xpdfreader.com/xpdf-japanese.tar.gz && tar xvfz ./xpdf-japanese.tar.gz && mkdir -p /usr/local/share/xpdf && mv ./xpdf-japanese /usr/local/share/xpdf/japanese
COPY xpdfrc /data/.xpdfrc


WORKDIR /data
VOLUME /data
