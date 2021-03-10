From webdevops/php-nginx:7.3-alpine

ARG version=v1.8.2

RUN mkdir -p /www/wwwroot \
    && git clone --branch $version --depth=1 https://github.com/assimon/dujiaoka.git /www/wwwroot/dujiaoka

COPY ./conf/default.conf /opt/docker/etc/nginx/conf.d/
COPY ./conf/dujiao.conf /opt/docker/etc/supervisor.d/
COPY start.sh /

RUN chmod +x /start.sh

ENTRYPOINT ["/start.sh"]