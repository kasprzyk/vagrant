FROM debian:10-slim

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteeractive apt-get install -y \
    apache2 \
    php7.3 \
    php-mysql

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
    && dpkg-reconfigure --frontend=noninteractive locales \
    && update-locale LANG=en_US.UTF-8
ENV LANG en_US.UTF-8docker i