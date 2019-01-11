FROM alpine:latest
MAINTAINER shenlan xz@onwalk.net
COPY docker-entrypoint.sh /
COPY default.conf /etc/nginx/conf.d/default.conf
ADD  repositories /etc/apk/repositories 
RUN  apk --update add nginx

VOLUME ['/var/www/localhost/htdocs/']  
EXPOSE 80

ENTRYPOINT ["/docker-entrypoint.sh"]
