# Dockerfile for lint-openapi

[`lint-openapi`](https://github.com/IBM/openapi-validator) is a way to validate OpenAPI files.

## Build Concerns

There should be relatively few build concerns with this image. I trust IBM to keep the OpenAPI validator on npm.

Periodically, npm may need to be updated in the Dockerfile.

## Runtime Concerns

Make sure the volume is mounted, and everything should be fine.
