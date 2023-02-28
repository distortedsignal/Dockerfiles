FROM registry.access.redhat.com/ubi9/ubi:9.1.0

RUN dnf install -y pip

RUN python3 -m pip install diffusers transformers accelerate scipy safetensors xformers

COPY import_sd.py /import_sd.py

ENTRYPOINT [ "python3", "-i", "/import_sd.py" ]