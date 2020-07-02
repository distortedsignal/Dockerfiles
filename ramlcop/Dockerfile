# Dockerfile for a RAML-cop container

# Latest alpine at time of development
FROM alpine:3.11.2

RUN apk add --no-cache npm=12.15.0-r0

RUN npm install --global raml-cop@5.0.0

ADD ramlize /bin/ramlize

# The user MUST set the DocsPath var AND somehow include the
# desired directory (the author recommends volume mounts, but
# that is by no means the only way)

ENTRYPOINT [ "ramlize" ]
