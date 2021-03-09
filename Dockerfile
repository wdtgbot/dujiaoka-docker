From webdevops/php-nginx:7.4-alpine

ARG version=v1.8.2

COPY default.conf /opt/docker/etc/nginx/conf.d/
COPY fastcgi.conf /conf
COPY pathinfo.conf /conf

RUN git clone --branch $version --depth=1 https://github.com/assimon/dujiaoka.git /dujiaoka
