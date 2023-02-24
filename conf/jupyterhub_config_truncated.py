from jupyter_client.localinterfaces import public_ips
import dockerspawner
import os
c = get_config()  #noqa
c.JupyterHub.debug_proxy = True
ip = public_ips()[0]
c.JupyterHub.hub_ip = ip
notebook_dir = os.environ.get('DOCKER_NOTEBOOK_DIR') or '/home/jovyan/work'
c.JupyterHub.spawner_class = 'dockerspawner.DockerSpawner'
c.DockerSpawner.debug = True
c.DockerSpawner.extra_host_config = {
        'runtime'    : 'nvidia',
        'privileged' : True
}
c.DockerSpawner.network_name = 'jupyter'
c.DockerSpawner.image = 'lab-ws.home.hallenbeck.org:5000/hudson/my_tf_singleuser:1.0.0'
c.DockerSpawner.notebook_dir = notebook_dir
c.DockerSpawner.volumes = { 'jupyterhub-user-{username}': notebook_dir }
c.DockerSpawner.remove = False
c.JupyterHub.ssl_cert = '/conf/jhub.crt'
c.JupyterHub.ssl_key = '/conf/jhub.key'
c.Spawner.debug = True
c.Spawner.default_url = '/lab'
