#!/bin/bash

CONTAINER_IMAGE='my_hub'
CONTAINER_TAG='1.0.13'
CONTAINER_NETWORK='jupyter'

docker run -d \
	--privileged \
	--network ${CONTAINER_NETWORK} \
	-p 8000:8000 \
	-p 8081:8081 \
	-v /home/hudson/Projects/jupyterhub/conf/jupyterhub_config.py:/conf/jupyterhub_config.py \
	-v /etc/passwd:/etc/passwd \
	-v /etc/group:/etc/group \
	-v /etc/shadow:/etc/shadow \
	-v /var/run/docker.sock:/var/run/docker.sock \
	${CONTAINER_IMAGE}:${CONTAINER_TAG}
