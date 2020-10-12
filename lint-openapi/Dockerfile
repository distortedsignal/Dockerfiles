# Dockerfile for a RAML-cop container

# Latest alpine at time of development
FROM alpine:3.11.2

RUN apk add --no-cache npm=12.15.0-r1 python3=3.8.2-r1

RUN npm install --global ibm-openapi-validator@0.30.1
