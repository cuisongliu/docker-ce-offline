# docker-ce-offline
docker offline package **no dependent** 
## install

```
   git clone git@github.com:cuisongliu/docker-ce-offline.git
   cd docker-ce-offline
   chmod a+x * 
   sh ./docker-install.sh
```

## uninstall 
```
  sh ./docker-uninstall.sh
```

## set tcp port (tcp://127.0.0.1:[port])
```
  sh ./docker-install.sh 9999
```
### docker info verify tcp port is setting ?

```
  docker info 
```

### docker enter container 
```
  docker-enter $container-id
```
### docker rm all stop container
```
  docker-rm
```
### docker rmi all <none> images 
```
  docker-rmi
```
## docker stop and rm container
```
  docker-rm-container $container-name
```  
