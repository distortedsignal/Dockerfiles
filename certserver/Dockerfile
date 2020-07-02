FROM python:3.7-alpine

CMD apk add openssl

COPY minica/minica /usr/local/sbin
COPY index.html /tmp/index.html
COPY server.py /tmp/server.py



CMD pip install flask gunicorn

ENTRYPOINT [ "gunicorn", "/tmp/server:app" ]
