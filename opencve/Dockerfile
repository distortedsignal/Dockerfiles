# Dockerfile for a RAML-cop container

# Latest alpine at time of development
FROM alpine:latest

RUN apk add postgresql postgresql-contrib redis python3 py3-pip postgresql-libs postgresql-dev && \
        apk add --virtual .build-deps --no-cache gcc musl-dev libffi-dev openssl-dev python3-dev rust cargo && \
        pip3 install wheel six && \
        pip3 install opencve && \
        apk del .build-deps && \
        ln -sf python3 /usr/bin/python

ADD entrypoint.sh /run/entrypoint/entrypoint.sh
RUN adduser -D -h /home/opencve opencve opencve && \
        mkdir -p /run/postgresql /home/postgres /home/redis /home/opencve && \
        chown -R postgres:postgres /home/postgres && \
        chown -R redis:redis /home/redis && \
        chown -R opencve:opencve /home/opencve && \
        chown -R postgres:postgres /run/postgresql && \
        chown -R redis:redis /run/redis && \
        chmod a+x /run/entrypoint/entrypoint.sh

EXPOSE 8000/tcp
EXPOSE 8000/udp

ENTRYPOINT [ "/run/entrypoint/entrypoint.sh" ]
