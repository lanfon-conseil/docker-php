FROM lanfon-conseil/php:7.0-apache
MAINTAINER lanfon-conseil <contact@lanfon-conseil.com>

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
RUN curl -s https://packagecloud.io/install/repositories/varnishcache/varnish52/script.deb.sh | bash

EXPOSE 6081
