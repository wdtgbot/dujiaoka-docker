#!/bin/sh

if [ -f "/dujiaoka/.env" ]; then
    if [ ! -d "./storage/app" ]; then
        mv -n storage_bak/* storage/
    fi
    supervisord
else
    echo "配置文件不存在，请根据文档修改配置文件！"
fi
