# Dockerfile for opencve

[`opencve`](https://www.opencve.io/welcome) is a utility for monitoring CVEs in various products. It should pull CVE updates directly from the NVD.

## Build Concerns

* This takes about 5 minutes to build from start to finish, and the `entrypoint` script MUST exist within the docker folder.
* This does not initialize the db during build because I don't want to store the entire db on docker hub.

## Runtime Concerns

* This pulls down the db during runtime, and as such, it takes _a long time_ to start up.
* The http server should be ready when (something like) the following lines have been printed:

```
[2021-09-08 18:54:47,864: INFO/MainProcess] beat: Starting...
[2021-09-08 18:54:48 +0000] [68] [INFO] Starting gunicorn 20.0.4
[2021-09-08 18:54:48 +0000] [68] [INFO] Listening at: http://0.0.0.0:9000 (68)
[2021-09-08 18:54:48 +0000] [68] [INFO] Using worker: sync
[2021-09-08 18:54:48 +0000] [75] [INFO] Booting worker with pid: {number}
[2021-09-08 18:54:48,520: INFO/MainProcess] Connected to redis://127.0.0.1:6379/0
[2021-09-08 18:54:48,534: INFO/MainProcess] mingle: searching for neighbors
[2021-09-08 18:54:49,562: INFO/MainProcess] mingle: all alone
[2021-09-08 18:54:49,580: INFO/MainProcess] celery@{random_characters} ready.
```
