#! /bin/bash

CONTAINER_TAG="distortedsignal/cert_server"
VERSION_MAJOR="1"
VERSION_MINOR="0"
VERSION_BUGFIX="0"

git clone git@github.com:jsha/minica.git 

cd minica

GO111MODULE="on" go build

cd ..

docker rmi "$CONTAINER_TAG":"$VERSION_MAJOR"."$VERSION_MINOR"."$VERSION_BUGFIX" \
           "$CONTAINER_TAG":"$VERSION_MAJOR"."$VERSION_MINOR" \
           "$CONTAINER_TAG":"$VERSION_MAJOR" \
           "$CONTAINER_TAG":latest

docker build -t "$CONTAINER_TAG":"$VERSION_MAJOR"."$VERSION_MINOR"."$VERSION_BUGFIX" \
             -t "$CONTAINER_TAG":"$VERSION_MAJOR"."$VERSION_MINOR" \
             -t "$CONTAINER_TAG":"$VERSION_MAJOR" \
             -t "$CONTAINER_TAG":latest \
             .
