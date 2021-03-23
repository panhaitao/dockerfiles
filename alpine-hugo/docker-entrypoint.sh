#!/bin/sh
cd /site && \
hugo server --bind ${bind_ip}  --baseURL ${base_url} --config /site/config.toml
