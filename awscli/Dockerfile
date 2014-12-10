FROM ubuntu:trusty

MAINTAINER y_uuki

RUN apt-get update && \
    apt-get install -yq --no-install-recommends  awscli groff-base && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && rm -rf /tmp

RUN mkdir -p /root/.aws
RUN /bin/echo -e '[default]\noutput = json\nregion = $AMAZON_REGION\naws_access_key_id = $AMAZON_ACCESS_KEY_ID\naws_secret_access_key = $AMAZON_SECRET_ACCESS_KEY' > /root/.aws/config

ENTRYPOINT ["aws"]
