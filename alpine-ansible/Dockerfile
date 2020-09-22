FROM alpine:latest
MAINTAINER shenlan xz@onwalk.net
ADD  repositories /etc/apk/repositories 
RUN  apk --update add nginx git ansible sshpass curl
RUN  chown root:nginx /var/www/localhost/* 
RUN  mkdir /data/ && cd /data && git clone https://github.com/panhaitao/ansible-playbook-store.git playbook
COPY default.conf /etc/nginx/conf.d/default.conf
COPY docker-entrypoint.sh /

VOLUME ['/var/www/']  
EXPOSE 80

ENTRYPOINT ["/docker-entrypoint.sh"]
