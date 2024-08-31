FROM debian:bookworm-20240812-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
  apt-get install -y apt-utils

RUN apt-get install -y --no-install-recommends apt-transport-https ca-certificates sudo wget curl \
  software-properties-common supervisor

# Install FreeRADIUS
#RUN add-apt-repository -y ppa:freeradius/stable && \
RUN apt-get update && \
    apt-get install -y freeradius freeradius-utils

# Install git
RUN apt-get update && \
  apt-get install -y git

# Copy distribution files
COPY --chown=freerad:freerad files/ /

# Expose FreeRADIUS
EXPOSE 1812/udp 1813/udp
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
