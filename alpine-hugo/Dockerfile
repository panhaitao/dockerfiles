FROM alpine:3.12

ENV BIND_IP="0.0.0.0"
ENV HUGO_BASEURL=https://blog.onwalk.net
ENV HUGO_ENV=production

RUN apk update &&  apk add --no-cache ca-certificates libc6-compat libstdc++ git curl
RUN curl -L https://github.com/gohugoio/hugo/releases/download/v0.65.3/hugo_extended_0.65.3_Linux-64bit.tar.gz | tar -xz -C /tmp && \
    cp /tmp/hugo /usr/bin/ 
RUN mkdir -pv /site/ && \
    hugo new site /site/ && \
    mkdir -p /site/themes/hugo-geekdoc/  && \
    git clone https://github.com/panhaitao/markdown-blog.git /site/content/ && \
    curl -L https://github.com/thegeeklab/hugo-geekdoc/releases/latest/download/hugo-geekdoc.tar.gz | tar -xz -C /site/themes/hugo-geekdoc/ --strip-components=1

ADD config.toml /site/config.toml
ADD docker-entrypoint.sh /docker-entrypoint.sh

VOLUME /site
WORKDIR /site

ONBUILD RUN hugo -d /site/

EXPOSE 1313

ENTRYPOINT ["/docker-entrypoint.sh"]
