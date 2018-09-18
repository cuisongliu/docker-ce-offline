#!/bin/sh
command_exists() {
   command -v "$@" > /dev/null 2>&1
}
if command_exists docker; then
   set -x 
   systemctl stop  docker.service
   systemctl disable docker.service
   rm -rf /usr/local/bin/*
   rm -rf /var/lib/docker/* 
   rm -rf /etc/docker/*
fi
