#!/bin/bash

stunnel /etc/stunnel/openai.conf
if [ -z ${PROXY_HOST} ];then
    socat -ls -lu -lh TCP-LISTEN:443,reuseaddr,fork TCP:api.openai.com:443
else
    socat -ls -lu -lh TCP-LISTEN:443,reuseaddr,fork PROXY:${PROXY_HOST}:api.openai.com:443,proxyport=${PROXY_PORT}
fi
