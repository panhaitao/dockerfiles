#!/bin/bash

hugo new site /site
git clone https://github.com/panhaitao/markdown-blog.git /site/content/
cd /site && hugo server -D

