FROM php:zts-alpine

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN apk --update add wget curl git grep build-base libmemcached-dev zlib-dev pcre-dev libtool make autoconf g++ cyrus-sasl-dev libgsasl-dev supervisor
RUN docker-php-ext-install pdo pdo_mysql opcache

RUN pecl install redis memcached swoole
RUN docker-php-ext-enable redis memcached swoole
