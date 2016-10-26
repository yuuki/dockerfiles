FROM debian:jessie

MAINTAINER y_uuki yuki.tsubo@gmail.com

ENV DEBIAN_FRONTEND noninteractive
RUN \
  apt-get update && \
  apt-get install -y build-essential git curl supervisor libreadline-dev zlib1g zlib1g-dev libbz2-dev libsqlite3-dev libssl-dev && \
  rm -fr /var/lib/apt/lists/*

ENV PATH /opt/python/bin:/usr/local/bin:$PATH

# install python
RUN \
  git clone git://github.com/yyuu/pyenv.git && \
  cd pyenv/plugins/python-build && \
  ./install.sh
RUN python-build 2.7.6 /opt/python

# install pip
RUN curl -s https://bootstrap.pypa.io/get-pip.py > /tmp/get-pip.py
RUN python /tmp/get-pip.py

# install graphite modules
RUN apt-get update && apt-get install -y libcairo2-dev libffi-dev  --fix-missing && rm -fr /var/lib/apt/lists/*

RUN install -d -m 755 /var/lib/graphite
WORKDIR /var/lib/graphite
RUN pip install git+https://github.com/yuuki/whisper.git@support-fadvise-random --install-option="--prefix=/var/lib/graphite" --install-option="--install-lib=/var/lib/graphite/lib"
RUN pip install git+https://github.com/yuuki/carbon.git@support-fadvise-random --install-option="--prefix=/var/lib/graphite" --install-option="--install-lib=/var/lib/graphite/lib"
RUN pip install uwsgi==2.0.1
RUN pip install git+https://github.com/graphite-project/graphite-web.git@master --install-option="--prefix=/var/lib/graphite" --install-option="--install-lib=/var/lib/graphite/lib"

RUN install -d m 755 /var/log/graphite
RUN install -d -m 755 /etc/carbon
COPY carbon /etc/carbon
COPY graphite-web/local_settings.py /var/lib/graphite/lib/graphite/local_settings.py
COPY graphite-web/graphite.wsgi /var/lib/graphite/conf/graphite.wsgi
COPY supervisord.conf /etc/supervisord.conf
RUN touch /var/log/graphite/info.log /var/log/graphite/exception.log /var/log/graphite/access.log /var/log/graphite/error.log

ENV PYTHONPATH /var/lib/graphite/lib
ENV LC_ALL en_US.UTF-8
RUN python /var/lib/graphite/lib/graphite/manage.py syncdb --noinput

EXPOSE 8000 2003 2004 7002
VOLUME /var/log/graphite /var/lib/graphite/storage/whisper

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
