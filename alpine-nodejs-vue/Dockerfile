FROM alpine
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories
RUN apk --update add nodejs npm git
RUN mkdir -pv /nodejs
RUN cd /nodejs && npm config set registry="http://registry.npm.taobao.org"
RUN npm install --global webpack-cli vue-cli
RUN npm install --global element-ui --save
RUN npm install --global axios --save

WORKDIR /nodejs

CMD ["sh"]

#add docker-entrypoint.sh /
#ENTRYPOINT ["/docker-entrypoint.sh"]
#EXPOSE 8080
