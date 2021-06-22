#!/bin/sh
root_pw=$1
echo "root:$root_pw" | chpasswd
