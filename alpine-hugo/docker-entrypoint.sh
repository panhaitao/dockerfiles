#!/bin/sh
cd /site && \
hugo server --bind ${bind_ip}  --b ${base_url} --config /site/config.toml
