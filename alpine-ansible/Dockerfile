FROM alpine:latest
MAINTAINER shenlan xz@onwalk.net

ENV  ROOT_PW=root@1234 
ADD  set_root_pw.sh /sbin/
RUN  /sbin/set_root_pw.sh $ROOT_PW
 
ADD  repositories /etc/apk/repositories 
RUN  apk --update add nginx git ansible sshpass curl
RUN  mkdir /data/ && cd /data && git clone https://github.com/panhaitao/ansible-playbook-store.git playbook

RUN  chown root:nginx /var/www/localhost/* 
COPY default.conf /etc/nginx/conf.d/default.conf
COPY docker-entrypoint.sh /


VOLUME ['/var/www/']  
EXPOSE 80

ENTRYPOINT ["/docker-entrypoint.sh"]
