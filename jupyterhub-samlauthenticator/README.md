# Dockerfile for Jupyterhub-SAMLAuthenticator

I've been pretty active in the [Jupyterhub-SAMLAuthenticator](https://github.com/bluedatainc/jupyterhub-samlauthenticator/) project, and I figure I should probably have a Dockerfile to create a Docker container that contains the current version of the Authenticator.

## Build Concerns

This should be based on a recent, stable version of the [jupyterhub/jupyterhub image](https://hub.docker.com/r/jupyterhub/jupyterhub). If that image is updated, it should be fairly trivial to change the base and rebuild the container.

This downloads the latest version of the SAMLAuthenticator from [`PyPI`](https://pypi.org/project/jupyterhub-samlauthenticator/). If the machine building the container doesn't have access to PyPI, you're gonna have a bad time.

Currently, this does not update the version of the SAMLAuthenticator. It seems that this should be fairly simple to do.

## Runtime Concerns

This container requires a volume mount. The volume _MUST_ be mounted to `/srv/jupyterhub/config` and _MUST_ contain  a `jupyterhub_config.py` file (provided in this repo). From there, it is probably wise to either serialize the XML metadata in as a string value (via the `metadata_content` field) or include the metadata as an xml file in that directory. If the second option is desired, then the filename would have to be `/srv/jupyterhub/config/$filename`, where `$filename` should be replaced with the name of the metadata file.

This container should be run as a daemon (with the `-d` flag) so that the terminal running the container can be used for something else while the container is running.

A common `docker run` command will look like this:

```sh
docker run -d -v $(pwd)/jupyterhub-samlauthenticator:/srv/jupyterhub/config -p 8000:8000 ${container_id}
```

## License Concerns

The JupyterHub License is reproduced here in order to cover the code copied from the jupterhub project. It can be found in the `Jupyterhub_license.txt` file.

## Redistribution Concerns

Please don't publish this container anywhere. It's not good, and it's not worth it to make it good.
