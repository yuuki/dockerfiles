FROM yuuki/ubuntu-texlive-en

RUN apt-get update -yq && apt-get -yq install --no-install-recommends --fix-missing \
    texlive-lang-japanese \
    language-pack-ja \
    fonts-noto-cjk \
    fonts-noto-cjk-extra \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN tlmgr init-usertree
RUN kanji-config-updmap-sys ipaex

# Install xpdf
RUN wget https://xpdfreader-dl.s3.amazonaws.com/xpdf-japanese.tar.gz && tar xvfz ./xpdf-japanese.tar.gz && mkdir -p /usr/local/share/xpdf && mv ./xpdf-japanese /usr/local/share/xpdf/japanese
COPY xpdfrc /data/.xpdfrc

# PDF font setting
# http://yang.amp.i.kyoto-u.ac.jp/~yyama/FreeBSD/tex/fontemb-j.html
COPY ipa.map /usr/local/share/texmf/fonts/map/dvipdfmx/ipa.map
RUN mktexlsr

WORKDIR /data
VOLUME /data
