FROM alpine
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories
RUN apk --update add nodejs npm

RUN mkdir -pv /nodejs
RUN npm config set registry https://registry.npm.taobao.org
RUN npm i -g cnpm
RUN cnpm i -g  @vue/cli vue-router ant-design-vue axios

WORKDIR /nodejs

CMD ["sh"]

#add docker-entrypoint.sh /
#ENTRYPOINT ["/docker-entrypoint.sh"]
#EXPOSE 8080
