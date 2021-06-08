FROM php:7.4-cli
MAINTAINER lanfon-conseil <contact@lanfon-conseil.com>

RUN apt-get update && apt-get install -y git ssh-client \
  && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-configure gd --with-jpeg --with-freetype \
    && docker-php-ext-install -j$(nproc) \
    bcmath \
    bz2 \
    gd \
    exif \
    intl \
    json \
    mbstring \
    mysqli \
    pdo_mysql  \
    xmlrpc \
    xsl \
    zip

RUN echo "date.timezone = \"Europe/Paris\"" > /usr/local/etc/php/conf.d/timezone.ini
RUN echo "memory_limit=-1" > /usr/local/etc/php/conf.d/memory-limit.ini
RUN echo "zend.enable_gc=0" > /usr/local/etc/php/conf.d/disable-gc.ini

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
