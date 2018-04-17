FROM ozconseil/php:7.2-apache
MAINTAINER ozconseil <dev@ozconseil.com>

COPY apache2-foreground /usr/local/bin/

RUN apt-get update && apt-get install -y apt-transport-https
RUN curl https://repo.varnish-cache.org/debian/GPG-key.txt | apt-key add -
RUN echo "deb https://repo.varnish-cache.org/debian/ jessie varnish-4.1" >> /etc/apt/sources.list.d/varnish-cache.list \
  && apt-get update \
  && apt-get install -y varnish

EXPOSE 6081
