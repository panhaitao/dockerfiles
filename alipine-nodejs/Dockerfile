
FROM node:8.14-alpine
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories
RUN apk --update add git
RUN cd /nodejs-web && npm config set registry="http://registry.npm.taobao.org" && npm install

#RUN git clone http://zhangmeng05:zm901019@git.epai.io/sod/1002SystemMgtWeb.git /nodejs-web
#RUN cd /nodejs-web && git pull 
add docker-entrypoint.sh /
WORKDIR /nodejs-web
ENTRYPOINT ["/docker-entrypoint.sh"]
EXPOSE 8080
