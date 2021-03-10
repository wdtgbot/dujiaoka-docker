#!/bin/sh

if [ -f "/www/wwwroot/dujiaoka/.env" ];then
    echo "配置文件已存在，请确保配置文件正确！"
    chmod -R 777 /www/wwwroot/dujiaoka
    cd /www/wwwroot/dujiaoka && composer install
    status=$?
    if [ $status -ne 0 ]; then
        composer remove laravel/framework
        composer require laravel/framework:6.18.7
        composer install
    fi
    php artisan dujiao install
    /entrypoint supervisord
    else
    mv /www/wwwroot/dujiaoka/.env.example /www/wwwroot/dujiaoka/.env
    echo "配置文件不存在，请根据文档修改配置文件！"
fi
