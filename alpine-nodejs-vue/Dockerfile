FROM alpine
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories
RUN apk --update add nodejs npm python3 git

#RUN apk add -U curl bash ca-certificates openssl ncurses coreutils python3 make gcc g++ libgcc linux-headers grep util-linux binutils findutils
#RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh | bash
#RUN export NVM_DIR="$HOME/.nvm" 
#RUN source $HOME/.nvm/nvm.sh && nvm use --delete-prefix node
#$RUN source $HOME/.nvm/nvm.sh && nvm install v14.17.1
#RUN source $HOME/.nvm/nvm.sh && nvm ls

RUN mkdir -pv /nodejs
#RUN npm install nrm
#RUN cd /nodejs && npm config set registry="http://registry.npm.taobao.org"
#RUN npm install -g node-gyp
#RUN npm install -g @vue/cli
#RUN npm install -g @webpack/cli
#RUN npm install -g ant-design-vue --save
#RUN npm install -g axios --save

WORKDIR /nodejs

CMD ["sh"]

#add docker-entrypoint.sh /
#ENTRYPOINT ["/docker-entrypoint.sh"]
#EXPOSE 8080
