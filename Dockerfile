FROM webdevops/php-nginx:7.4-alpine

WORKDIR /dujiaoka

COPY dujiaoka/ /dujiaoka
COPY ./conf/default.conf /opt/docker/etc/nginx/vhost.conf
COPY ./conf/dujiao.conf /opt/docker/etc/supervisor.d/
COPY start.sh /

RUN set -xe \
    && rm -rf /var/lib/apt/lists/* \
    && composer install -vvv \
    && touch install.lock \
    && chmod +x /start.sh \
    && chmod -R 777 /dujiaoka \
    && cp -r storage storage_bak \
    && sed -i "s?\$proxies;?\$proxies=\'\*\*\';?" /dujiaoka/app/Http/Middleware/TrustProxies.php

CMD /start.sh
