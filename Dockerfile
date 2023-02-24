FROM jupyterhub/jupyterhub:3.1.1

COPY ./conf /conf/

RUN pip install --upgrade pip && \
    pip install --upgrade dockerspawner && \
    pip install --upgrade jupyter_client && \
    curl -sfSL https://get.docker.com | sh

ENTRYPOINT [ "jupyterhub" ]

CMD [ "-f", "/conf/jupyterhub_config.py" ]
