FROM nginx:alpine
MAINTAINER Tim Cinel <email@timcinel.com>

# gosu for custom uid/gid
RUN apk add --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ gosu

# purge any default config
RUN rm /etc/nginx/conf.d/*.*

add docker-entrypoint.sh setuidgid.inc /

ENTRYPOINT [ "/docker-entrypoint.sh" ]
CMD [ "nginx", "-g", "daemon off;" ]
