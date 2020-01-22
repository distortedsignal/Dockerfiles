#! /bin/bash

git clone git@github.com:jsha/minica.git 

cd minica

GO111MODULE="on" go build

cd ..

docker build -t distortedsignal/cert_server:1.0.0 -t distortedsignal/cert_server:1.0 -t distortedsignal/cert_server:1 -t distortedsignal/cert_server:latest .
