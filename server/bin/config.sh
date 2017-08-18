#!/bin/bash

echo 'setting link container and proxy port...'

while read p; do
  echo $p | sed "s/LINK_CONTAINER_NAME/${LINK_CONTAINER_NAME}/g; s/PROXY_PORT/${PROXY_PORT}/g" >> /etc/nginx/conf.d/proxy.conf
done </~/proxy.conf

/bin/bash ./bin/run.sh
