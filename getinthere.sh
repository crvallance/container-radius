docker exec -it `docker container ls | grep container-freerad | awk '{ print $1 }'` /bin/bash
