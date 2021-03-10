#!/bin/sh

if [ -f "/www/wwwroot/dujiaoka/.env" ];then
    echo "配置文件已存在，请确保配置文件正确！"
    chmod -R 777 /www/wwwroot/dujiaoka
    cd /www/wwwroot/dujiaoka && composer install || composer update laravel/framework && composer install
    php artisan dujiao install
    /entrypoint supervisord
    else
    mv /www/wwwroot/dujiaoka/.env.example /www/wwwroot/dujiaoka/.env
    echo "配置文件不存在，请根据文档修改配置文件！"
fi
