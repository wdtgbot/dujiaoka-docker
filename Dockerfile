FROM webdevops/php-nginx:7.4-alpine

ENV INSTALL=true

WORKDIR /dujiaoka

COPY dujiaoka/ /dujiaoka
COPY ./conf/default.conf /opt/docker/etc/nginx/vhost.conf
COPY ./conf/dujiao.conf /opt/docker/etc/supervisor.d/
COPY start.sh /

RUN set -xe \
    && rm -rf /var/lib/apt/lists/* \
    && composer install -vvv \
    && chmod +x /start.sh \
    && chmod -R 777 /dujiaoka \
    && sed -i "s?\$proxies;?\$proxies=\'\*\*\';?" /dujiaoka/app/Http/Middleware/TrustProxies.php \
    && sed -i "s/dfFxrate = 0.13/dfFxrate = 0.16/g" /dujiaoka/app/Http/Controllers/Pay/StripeController.php

CMD /start.sh
