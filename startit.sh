docker run -d -p 0.0.0.0:1812:1812/udp container-freerad && docker attach `docker container ls | grep container-freerad | awk '{ print $1 }'`
