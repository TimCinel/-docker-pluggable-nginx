#!/bin/sh -e

echo commands: $@

# set up user/group
source setuidgid.inc

# make nginx run as the user
sed -i "s/user nginx/user ${DOCKER_USER} ${DOCKER_GROUP}/" /etc/nginx/nginx.conf

# go go go
exec "$@"
