FROM debian:10-slim

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    &&  apt-get install -y \
    apache2 \
    composer \
    curl \
    jq \
    gettext-base \
    wget \
    php7.3 \
    php7.3-bcmath \
    php7.3-gd \
    php7.3-gmp \
    php7.3-soap \
    php7.3-xml \
    php7.3-zip \
    php-mysql \
    && rm -rf /tmp/* \
    && apt-get remove -y apport \
    && apt autoremove -y \
    && apt-get autoclean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/share/lms
RUN chown -c www-data:www-data /usr/share/lms
USER www-data
RUN APP_VERSION=`curl --silent "https://api.github.com/repos/chilek/lms/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/'` \
    && wget -qO- https://github.com/chilek/lms/archive/refs/tags/${APP_VERSION}.tar.gz | tar -zx -f - -C /usr/share/lms --strip-components=1

RUN composer install

USER root
RUN sed -i 's_DocumentRoot /var/www/html_DocumentRoot /usr/share/lms_' /etc/apache2/sites-available/000-default.conf \
    && mkdir /usr/share/lms/js/xajax_js/deferred \
    && chown -R 33:33 /usr/share/lms/js/xajax_js/deferred \
    && chmod -R 755 /usr/share/lms/js/xajax_js/deferred

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
