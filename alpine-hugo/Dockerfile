FROM alpine:3.12

RUN apk update &&  apk add --no-cache ca-certificates libc6-compat libstdc++ git curl

RUN curl -L https://github.com/gohugoio/hugo/releases/download/v0.65.3/hugo_extended_0.65.3_Linux-64bit.tar.gz | tar -xz -C /tmp && \
    cp /tmp/hugo /usr/bin/ 

RUN mkdir -pv /site/ &&    		    \  
    hugo new site /site/ &&		    \
    mkdir -p /site/themes/hugo-geekdoc/  && \
    curl -L https://github.com/thegeeklab/hugo-geekdoc/releases/latest/download/hugo-geekdoc.tar.gz | tar -xz -C /site/themes/hugo-geekdoc/ --strip-components=1
ADD config.toml /site/config.toml
ADD docker-entrypoint.sh /docker-entrypoint.sh

VOLUME /site
WORKDIR /site

EXPOSE 1313

ENTRYPOINT ["/docker-entrypoint.sh"]
