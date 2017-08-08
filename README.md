# Supported tags and respective `Dockerfile` links

## Apache - PHP 5.4

- [`5.4-apache` (*5.4/apache/Dockerfile*)](https://github.com/OzConseil/docker-php/blob/master/5.4/apache/Dockerfile)
- [`5.4-apache-xdebug` (*5.4/apache-xdebug/Dockerfile*)](https://github.com/OzConseil/docker-php/blob/master/5.4/apache-xdebug/Dockerfile)
- [`5.4-cli` (*5.4/cli/Dockerfile*)](https://github.com/OzConseil/docker-php/blob/master/5.4/cli/Dockerfile)
- [`5.4-onbuild` (*5.4/onbuild/Dockerfile*)](https://github.com/OzConseil/docker-php/blob/master/5.4/onbuild/Dockerfile)

## Apache - PHP 5.5

- [`5.5-apache` (*5.5/apache/Dockerfile*)](https://github.com/OzConseil/docker-php/blob/master/5.5/apache/Dockerfile)
- [`5.5-apache-xdebug` (*5.5/apache-xdebug/Dockerfile*)](https://github.com/OzConseil/docker-php/blob/master/5.5/apache-xdebug/Dockerfile)
- [`5.5-cli` (*5.5/cli/Dockerfile*)](https://github.com/OzConseil/docker-php/blob/master/5.5/cli/Dockerfile)
- [`5.5-onbuild` (*5.5/onbuild/Dockerfile*)](https://github.com/OzConseil/docker-php/blob/master/5.5/onbuild/Dockerfile)

## Apache - PHP 5.6

- [`5.6-apache` (*5.6/apache/Dockerfile*)](https://github.com/OzConseil/docker-php/blob/master/5.6/apache/Dockerfile)
- [`5.6-apache-xdebug` (*5.6/apache-xdebug/Dockerfile*)](https://github.com/OzConseil/docker-php/blob/master/5.6/apache-xdebug/Dockerfile)
- [`5.6-cli` (*5.6/cli/Dockerfile*)](https://github.com/OzConseil/docker-php/blob/master/5.6/cli/Dockerfile)
- [`5.6-onbuild` (*5.6/onbuild/Dockerfile*)](https://github.com/OzConseil/docker-php/blob/master/5.6/onbuild/Dockerfile)

## Apache - PHP 7.0

- [`7.0-apache` (*7.0/apache/Dockerfile*)](https://github.com/OzConseil/docker-php/blob/master/7.0/apache/Dockerfile)
- [`7.0-apache-xdebug` (*7.0/apache-xdebug/Dockerfile*)](https://github.com/OzConseil/docker-php/blob/master/7.0/apache-xdebug/Dockerfile)
- [`7.0-cli` (*7.0/cli/Dockerfile*)](https://github.com/OzConseil/docker-php/blob/master/7.0/cli/Dockerfile)
- [`7.0-onbuild` (*7.0/onbuild/Dockerfile*)](https://github.com/OzConseil/docker-php/blob/master/7.0/onbuild/Dockerfile)
- [`7.0-varnish` (*7.0/varnish/Dockerfile*)](https://github.com/OzConseil/docker-php/blob/master/7.0/varnish/Dockerfile)
- [`7.0-varnish-xdebug` (*7.0/varnish-xdebug/Dockerfile*)](https://github.com/OzConseil/docker-php/blob/master/7.0/varnish-xdebug/Dockerfile)

## Apache - PHP 7.1

- [`7.1-apache` (*7.1/apache/Dockerfile*)](https://github.com/OzConseil/docker-php/blob/master/7.1/apache/Dockerfile)
- [`7.1-apache-xdebug` (*7.1/apache-xdebug/Dockerfile*)](https://github.com/OzConseil/docker-php/blob/master/7.1/apache-xdebug/Dockerfile)
- [`7.1-cli` (*7.1/cli/Dockerfile*)](https://github.com/OzConseil/docker-php/blob/master/7.1/cli/Dockerfile)
- [`7.1-onbuild` (*7.1/onbuild/Dockerfile*)](https://github.com/OzConseil/docker-php/blob/master/7.1/onbuild/Dockerfile)
- [`7.1-varnish` (*7.1/varnish/Dockerfile*)](https://github.com/OzConseil/docker-php/blob/master/7.1/varnish/Dockerfile)
- [`7.1-varnish-xdebug` (*7.1/varnish-xdebug/Dockerfile*)](https://github.com/OzConseil/docker-php/blob/master/7.1/varnish-xdebug/Dockerfile)

## More

For more information about these images and there history, please see the [relevant manifest file (`library/php`)](https://github.com/docker-library/official-images/blob/master/library/php) in the [`docker-library/official-images` GitHub repo](https://github.com/docker-library/official-images).

![logo](https://raw.githubusercontent.com/docker-library/docs/master/php/logo.png)

# How to use these images.

## With Command Line

For PHP projects run through the command line interface (CLI), you can do the following.

### Create a `Dockerfile` in your PHP project

  FROM ozconseil/php:5.6-cli
  COPY . /usr/src/myapp
  WORKDIR /usr/src/myapp
  CMD [ "php", "./your-script.php" ]

Then, run the commands to build and run the Docker image:

  docker build -t my-php-app .
  docker run -it --rm --name my-running-app my-php-app

## With Apache

More commonly, you will probably want to run PHP in conjunction with Apache httpd. Conveniently, there's a version of the PHP container that's packaged with the Apache web server.

### Create a `Dockerfile` in your PHP project

  FROM ozconseil/php:5.6-apache
  COPY src/ /var/www/html/

Where `src/` is the directory containing all your php code. Then, run the commands to build and run the Docker image:

  docker build -t my-php-app .
  docker run -it --rm --name my-running-app my-php-app

We recommend that you add a custom `php.ini` configuration. `COPY` it into `/usr/local/etc/php` by adding one more line to the Dockerfile above and running the same commands to build and run:

  FROM ozconseil/php:5.6-apache
  COPY config/php.ini /usr/local/etc/php
  COPY src/ /var/www/html/

Where `src/` is the directory containing all your php code and `config/` contains your `php.ini` file.

## Apache modules

### Apache modules already loaded

- mod_rewrite

### How to install more Apache modules

Add this line to your Dockerfile:
`RUN a2enmod rewrite`

## PHP extensions

### PHP extensions already loaded

- mysqlnd
- curl
- openssl
- pcre
- readline
- recode
- zlib
- bz2
- gd (jpg/png/ttf)
- intl
- mbstring
- mcrypt
- mysqli
- pdo_mysql
- pdo_pgsql
- pgsql
- zip

### How to install more PHP extensions

We provide two convenient scripts named `docker-php-ext-configure` and `docker-php-ext-install`, you can use them to easily install PHP extension.

For example, if you want to have a PHP-FPM image with `iconv`, `mcrypt` and `gd` extensions, you can inheriting the base image that you like, and write your own `Dockerfile` like this:

````docker
FROM ozconseil/php:5.6
# Install modules
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
    && docker-php-ext-install iconv mcrypt \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd
````

Remember, you must install dependencies for your extensions manually. If an extension needs custom `configure` arguments, you can use the `docker-php-ext-configure` script like this example.

# License

View [license information](http://php.net/license/) for the software contained in this image.

# Supported Docker versions

This image is officially supported on Docker version 1.7.0.

Support for older versions (down to 1.0) is provided on a best-effort basis.

