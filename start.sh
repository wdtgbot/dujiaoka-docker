#!/bin/sh

if [ -f "/dujiaoka/.env" ];then
    echo "配置文件已存在，请确保配置文件正确！"
    chmod -R 755 /dujiaoka
    cd /dujiaoka && php artisan dujiao install || composer update laravel/framework && php artisan dujiao install
    /entrypoint supervisord
    else
    mv /dujiaoka/.env.example /dujiaoka/.env
    echo "配置文件不存在，请根据文档修改配置文件！"
fi
