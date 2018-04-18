FROM ozconseil/php:7.2-apache
MAINTAINER ozconseil <dev@ozconseil.com>

COPY apache2-foreground /usr/local/bin/

# Install some packages
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    build-essential \
    debian-archive-keyring \
    gnupg2 \
    mysql-client \
    openssh-client \
    && rm -rf /var/lib/apt/lists/*

# Install Varnish
RUN curl -L https://packagecloud.io/varnishcache/varnish5/gpgkey | apt-key add -
RUN echo "deb https://packagecloud.io/varnishcache/varnish5/ubuntu/ xenial main" >> /etc/apt/sources.list.d/varnish-cache.list \
    echo "deb-src https://packagecloud.io/varnishcache/varnish5/ubuntu/ xenial  main" >> /etc/apt/sources.list.d/varnish-cache.list \
    && apt-get update \
    && apt-get install -y varnish \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 6081
