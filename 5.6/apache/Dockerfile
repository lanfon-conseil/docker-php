FROM php:5.6-apache
MAINTAINER ozconseil <dev@ozconseil.com>

RUN a2enmod expires
RUN a2enmod headers
RUN a2enmod rewrite

RUN apt-get update && apt-get install -y \
    curl \
    g++ \
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
    openssl \
    wget \
    zlib1g-dev \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir /usr/include/freetype2/freetype && ln -s /usr/include/freetype2/freetype.h /usr/include/freetype2/freetype/freetype.h

RUN docker-php-ext-configure gd --with-jpeg-dir --with-freetype-dir \
    && docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd \
    && docker-php-ext-install -j$(nproc) \
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
    opcache \
    pdo_mysql \
    xmlrpc \
    xsl \
    zip

# set recommended PHP.ini settings
# see https://secure.php.net/manual/en/opcache.installation.php
RUN { \
		echo 'opcache.memory_consumption=128'; \
		echo 'opcache.interned_strings_buffer=8'; \
		echo 'opcache.max_accelerated_files=4000'; \
		echo 'opcache.revalidate_freq=60'; \
		echo 'opcache.fast_shutdown=1'; \
		echo 'opcache.enable_cli=0'; \
	} > /usr/local/etc/php/conf.d/opcache-recommended.ini
RUN echo "date.timezone = \"Europe/Paris\"" > /usr/local/etc/php/conf.d/timezone.ini
