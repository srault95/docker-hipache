FROM srault95/docker-circus-base

MAINTAINER <stephane.rault@radicalspam.org>

ENV DRIVER redis://172.17.42.1:6379/0

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y \
  nodejs \
  npm

RUN git clone https://github.com/hipache/hipache/tarball/master /code/hipache

RUN npm install -g /code/hipache --production

ENV NODE_ENV production
RUN mkdir -p /etc/hipache
RUN mkdir -p /var/log/hipache

ADD config/conf/config.json.tpl /etc/hipache/
RUN envtpl -o /etc/hipache/config.json /etc/hipache/config.json.tpl --keep-template --allow-missing

ADD config/circus.d/* /etc/circus.d/
ADD config/setup.d/rsyslogd /etc/setup.d/10-rsyslogd
ADD config/setup.d/hipache /etc/setup.d/20-hipache
RUN chmod +x /etc/setup.d/*

EXPOSE 80
EXPOSE 443

