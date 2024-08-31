mycontain=`docker container ls | grep container-freerad | awk '{ print $1 }'`
docker stop $mycontain && docker start $mycontain 
