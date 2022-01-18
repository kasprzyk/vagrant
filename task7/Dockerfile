FROM debian:10-slim

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteeractive apt-get install -y \
    apache2 \
    php7.3 \
    php-mysql \
    wget

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
    && dpkg-reconfigure --frontend=noninteractive locales \
    && update-locale LANG=en_US.UTF-8
ENV LANG en_US.UTF-8

WORKDIR /usr/share/lms
RUN chown -R www-data:www-data /usr/share/lms
USER www-data
RUN APP_VERSION=`curl --silent "https://api.github.com/repositories/3524851/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/'` \
    && wget -qO- https://github.com/chilek/lms/archive/refs/tags/${APP_VERSION}.tar.gz | tar -zx -f - -C /usr/share/lms --strip-components=1

RUN composer install

USER root

