FROM golang:latest

RUN mkdir /DemoAPI 
RUN cd /DemoAPI && go mod init DemoAPI
RUN cd /DemoAPI && go get github.com/gin-gonic/gin

WORKDIR /DemoAPI

CMD ["sh"]

#add docker-entrypoint.sh /
#ENTRYPOINT ["/docker-entrypoint.sh"]
#EXPOSE 8080
