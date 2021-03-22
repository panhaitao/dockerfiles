#!/bin/sh

/set_root_pw.sh $ROOT_PW

ssh-keygen -t rsa -b 2048 -f $HOME/.ssh/id_rsa -P "" -q
ssh-keygen -t rsa -b 2048 -f /etc/ssh/ssh_host_rsa_key -P "" -q
ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key -P "" -q
ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -P "" -q
ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ed25519_key -P "" -q
nohup /usr/sbin/sshd -f /etc/ssh/sshd_config &>/tmp/log &

mkdir -p /run/nginx/
touch /run/nginx/nginx.pid
nginx -g "daemon off;" 
chown root:nginx /var/www/localhost/* 

