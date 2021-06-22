#FROM alpine:latest AS build
FROM alpine:latest
RUN \
    apk update && \
    apk add --no-cache curl bash ca-certificates openssl ncurses coreutils python2 make gcc g++ libgcc linux-headers grep util-linux binutils findutils && \
    touch ~/.bashrc && \
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash



CMD ["bash"]

