FROM jupyterhub/jupyterhub:1.2

RUN python3 -m pip install --no-cache --upgrade jupyterhub-samlauthenticator

RUN mkdir -p /srv/jupyterhub/config
VOLUME /srv/jupyterhub/config

LABEL maintainer="Tom Kelley <distortedsignal@gmail.com>"

CMD ["jupyterhub", "-f", "/srv/jupyterhub/config/jupyterhub_config.py"]
