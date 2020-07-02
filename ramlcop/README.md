# Dockerfile for ramlcop

[`ramlcop`](https://www.npmjs.com/package/raml-cop) is a small utility that probably doesn't get enough attention. I wanted to do some automated checks on some RAML that I was working with, and I wanted to use a docker image to do those checks. This file is the result of that.

## Build Concerns

There should be relatively few build concerns with this image. Everything required for the image is contained in this repository. So long as raml-cop remains live on npm, building this image should not be a problem.

Periodically, npm may need to be updated in the Dockerfile.

## Runtime Concerns

This container requires a volume mount. The volume can be mounted to any available location in the container. The volume _MUST_ container _ALL FILES_ required to confirm that the RAML is well-formed.

This container also requires that, at runtime, the user specify where the RAML files are located. It is assumed that all RAML files are located in the same folder. The environment variable is expected to be `DocsPath`. If the container is started when `DocsPath` is not set, the container will exit with code `2`.

This container is expected to be run as a foreground process. If the executable encounters an error with the RAML, the container will exit with code `1`. If the executable does not encounter any errors with the RAML, the container will exit with code `0`.

A common `docker run` command will look like this:

```sh
docker run -v $(pwd)/raml:/src/raml --env DocsPath=/src/raml ${container_id}
```
