# Dockerfiles
Some Dockerfiles that I might find helpful.

## How To's

### How to Build

From the root directory of the repo:
```sh
docker build ${directory}
```

### How to Build and Tag for Docker Hub

```sh
docker build ${directory} -t distortedsignal/${directory}
```

### How to Build and Tag for Github Container Repo

```sh
docker build ${directory} -t ghcr.io/distortedsignal/${directory}
```

### How to Push to Docker Hub

This assumes that the appropriate tag exists and that the session is currently authenticated to Docker Hub.
```sh
docker push distortedsignal/${directory}
```

### How to Push to Github Container Repo

This assumes that the apprpriate token exists at `~/.github/package_deploy_token`.
```sh
> cat ~/.github/package_deploy_token | docker login ghcr.io -u distortedsignal --password-stdin
Login Succeeded
> docker push ghcr.io/distortedsignal/${tag}
...
```
