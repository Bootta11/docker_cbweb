FROM php:5.6.40-fpm-alpine

RUN apk update && apk add build-base && apk add autoconf openssl-dev g++ make && \
    apk del --purge autoconf openssl-dev g++ make

RUN apk add zlib-dev git zip \
  && docker-php-ext-install zip

  RUN apk update && apk add autoconf openssl-dev g++ make && \
    pecl install mongo && \
    docker-php-ext-enable mongo && \
    apk del --purge autoconf openssl-dev g++ make

RUN curl -sS https://getcomposer.org/installer | php \
        && mv composer.phar /usr/local/bin/ \
        && ln -s /usr/local/bin/composer.phar /usr/local/bin/composer

RUN apk add --update \
    python \
    python-dev \
    py-pip \
    build-base \
  && pip install virtualenv \
  && rm -rf /var/cache/apk/*

RUN apk add --no-cache bash
RUN apk add libpng-dev
RUN apk add libmcrypt-dev
RUN apk add mongodb
RUN apk add php-bcmath
RUN apk add curl-dev

RUN apk add nodejs=8.14.0-r0
RUN apk add npm=8.14.0-r0

RUN docker-php-ext-install gd
RUN docker-php-ext-install bcmath
RUN docker-php-ext-install mcrypt
RUN docker-php-ext-install curl
RUN docker-php-ext-install pdo_mysql

#EXPOSE 9000
