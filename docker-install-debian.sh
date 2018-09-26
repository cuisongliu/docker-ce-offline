#!/bin/sh
command_exists() {
   command -v "$@" > /dev/null 2>&1
}
if ! command_exists docker; then
   set -x 
   tar --strip-components=1 -xvzf docker-18.03.1-ce.tgz -C /usr/local/bin
   cp docker.service /lib/systemd/system/docker.service 
   if [ "$1" -gt 0 ] 2>/dev/null ;then 
     param="-H tcp://127.0.0.1:$1 -H unix:///var/run/docker.sock"
     sed -i "s#^ExecStart=.*#ExecStart=/usr/local/bin/dockerd $param #g" /lib/systemd/system/docker.service 
   fi
   systemctl enable  docker.service
   systemctl restart docker.service

cat > /etc/docker/daemon.json  << eof
{
  "registry-mirrors": [
     "http://373a6594.m.daocloud.io"
  ]
}
eof
   systemctl restart docker.service
   cp docker-compose-Linux-x86_64 /usr/local/bin/docker-compose
   cp docker-enter /usr/local/bin/docker-enter
   cp docker-rm /usr/local/bin/docker-rm
   cp docker-rmi /usr/local/bin/docker-rmi
   cp docker-rm-container /usr/local/bin/docker-rm-container
fi
