FROM php:5.6-cli
MAINTAINER ozconseil <dev@ozconseil.com>

RUN apt-get update && apt-get install -y \
    curl \
    g++ \
    git \
    imagemagick \
    libbz2-dev \
    libfreetype6-dev \
    libicu-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng12-dev \
    libpq-dev \
    libxml2-dev \
    libxslt1-dev \
    libzip-dev \
    nano \
    mysql-client \
    openssh-client  \
    wget \
    zlib1g-dev \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir /usr/include/freetype2/freetype && ln -s /usr/include/freetype2/freetype.h /usr/include/freetype2/freetype/freetype.h

RUN docker-php-ext-configure gd --with-jpeg-dir --with-freetype-dir \
    && docker-php-ext-install \
    bcmath \
    bz2 \
    gd \
    exif \
    intl \
    json \
    mbstring \
    mcrypt \
    mysqli \
    mysql \
    pdo_mysql \
    xmlrpc \
    xsl \
    zip

RUN echo "date.timezone = \"Europe/Paris\"" > /usr/local/etc/php/conf.d/timezone.ini
RUN echo "memory_limit=-1" > /usr/local/etc/php/conf.d/memory-limit.ini
RUN echo "zend.enable_gc=0" > /usr/local/etc/php/conf.d/disable-gc.ini

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
