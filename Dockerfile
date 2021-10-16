From webdevops/php-nginx:7.4-alpine

COPY dujiaoka/ /dujiaoka
COPY ./conf/default.conf /opt/docker/etc/nginx/vhost.conf
COPY ./conf/dujiao.conf /opt/docker/etc/supervisor.d/
COPY start.sh /

WORKDIR /dujiaoka

RUN composer install -vvv \
    && touch install.lock \
    && chmod +x /start.sh \
    && chmod 777 storage install.lock \
    && cp -r storage storage_bak

ENTRYPOINT ["/start.sh"]
