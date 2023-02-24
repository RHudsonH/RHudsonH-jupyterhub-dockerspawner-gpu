#!/bin/bash

CONTAINER_IMAGE='my_hub'
CONTAINER_TAG='1.0.11'
CONTAINER_IP='10.76.234.1'

docker run -d \
	--privileged \
	--network lab_hub \
	--ip ${CONTAINER_IP} \
	-v /home/hudson/Projects/jupyterhub/conf/jupyterhub_config.py:/conf/jupyterhub_config.py \
	-v /etc/passwd:/etc/passwd \
	-v /etc/group:/etc/group \
	-v /etc/shadow:/etc/shadow \
	-v /var/run/docker.sock:/var/run/docker.sock \
	${CONTAINER_IMAGE}:${CONTAINER_TAG}
