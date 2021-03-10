From webdevops/php-nginx:7.4-alpine

ARG version=v1.8.2

RUN git clone --branch $version --depth=1 https://github.com/assimon/dujiaoka.git /dujiaoka \
    && mkdir /conf

COPY ./conf/default.conf /opt/docker/etc/nginx/conf.d/
COPY ./conf/dujiao.conf /opt/docker/etc/supervisor.d/
COPY ./conf/fastcgi.conf /conf
COPY ./conf/pathinfo.conf /conf
COPY start.sh /

RUN chmod +x /start.sh

ENTRYPOINT ["/start.sh"]