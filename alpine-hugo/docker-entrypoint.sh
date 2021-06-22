#!/bin/sh
cd /site && \
hugo server --bind ${BIND_IP}         \
            --appendPort=false        \
            --baseURL ${HUGO_BASEURL} \
            --config /site/config.toml
