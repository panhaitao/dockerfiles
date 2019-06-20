#!/bin/sh
mkdir -p /run/nginx/
touch /run/nginx/nginx.pid
nginx -g "daemon off;" 
