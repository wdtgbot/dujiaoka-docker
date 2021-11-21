FROM webdevops/php-nginx:7.4-alpine

ENV INSTALL=true

WORKDIR /dujiaoka

COPY dujiaoka/ /dujiaoka
COPY ./conf/default.conf /opt/docker/etc/nginx/vhost.conf
COPY ./conf/dujiao.conf /opt/docker/etc/supervisor.d/
COPY ./modify/StripeController.php /dujiaoka/app/Http/Controllers/Pay/StripeController.php
COPY start.sh /

RUN set -xe \
    && rm -rf /var/lib/apt/lists/* \
    && composer install -vvv \
    && chmod +x /start.sh \
    && chmod -R 777 /dujiaoka \
    && mv /dujiaoka/storage /dujiaoka/storage_bak \
    && sed -i "s?\$proxies;?\$proxies=\'\*\*\';?" /dujiaoka/app/Http/Middleware/TrustProxies.php

CMD /start.sh
