# Dockerfile and referenced files that are copied into the container are from https://github.com/yobasystems/alpine-mariadb/blob/master/alpine-mariadb-amd64/Dockerfile

# But I changed some things, since I don't like using other base images (Even though, this image referenced in the repo is literally nothing but an alpine rootfs that is untarred into an scratch (completely empty, like unzipping the rootfs when building LFS) container)
# FROM yobasystems/alpine:3.14.0-amd64
FROM alpine:latest

# ARG BUILD_DATE
# ARG VCS_REF

# LABEL maintainer="Dominic Taylor <dominic@yobasystems.co.uk>" \
#     architecture="amd64/x86_64" \
#     mariadb-version="10.5.11" \
#     alpine-version="3.14.0" \
#     build="01-Jul-2021" \
#     org.opencontainers.image.title="alpine-mariadb" \
#     org.opencontainers.image.description="MariaDB Docker image running on Alpine Linux" \
#     org.opencontainers.image.authors="Dominic Taylor <dominic@yobasystems.co.uk>" \
#     org.opencontainers.image.vendor="Yoba Systems" \
#     org.opencontainers.image.version="v10.5.11" \
#     org.opencontainers.image.url="https://hub.docker.com/r/yobasystems/alpine-mariadb/" \
#     org.opencontainers.image.source="https://github.com/yobasystems/alpine-mariadb" \
#     org.opencontainers.image.revision=$VCS_REF \
#     org.opencontainers.image.created=$BUILD_DATE

RUN apk add --no-cache mariadb mariadb-client mariadb-server-utils pwgen && \
    rm -f /var/cache/apk/*

ADD files/run.sh /scripts/run.sh
RUN mkdir /docker-entrypoint-initdb.d && \
    mkdir /scripts/pre-exec.d && \
    mkdir /scripts/pre-init.d && \
    chmod -R 755 /scripts

EXPOSE 3306

VOLUME ["/var/lib/mysql", "/etc/mysql", "/etc/my.cnf.d"]

ENTRYPOINT ["/scripts/run.sh"]
