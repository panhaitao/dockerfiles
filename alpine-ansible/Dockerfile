FROM alpine:latest
MAINTAINER shenlan xz@onwalk.net
ADD  repositories /etc/apk/repositories 
RUN  apk --update add nginx git ansible
COPY docker-entrypoint.sh /

VOLUME ['/var/www/']  
EXPOSE 80

ENTRYPOINT ["/docker-entrypoint.sh"]
