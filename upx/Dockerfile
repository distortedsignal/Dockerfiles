# This is mostly taken from 
# https://github.com/gruebel/docker-upx/blob/670c94792fbd193ae29c432fb8e1d117873f17ad/Dockerfile
# and there are some minor changes

# build stage
FROM alpine:3.10 as builder

# devel branch
ENV LDFLAGS=-static

# download source and compile
RUN echo "installing dependencies" && \
    apk add --no-cache \
        build-base \
        git \
        ucl-dev \
        zlib-dev  && \
    echo "cloning upx" && \
    git clone -b devel --recursive https://github.com/upx/upx.git /upx && \
    echo "get tags from github" && \
    git -C /upx fetch --all --tags && \
    echo "checkout tag for 3.96" && \
    git -C /upx checkout tags/v3.96 -b v3.96 && \
    echo "updating makefile" && \
    sed -i 's/ -O2/ /' /upx/src/Makefile && \
    echo "running make" && \
    make -j10 -C /upx/src upx.out CHECK_WHITESPACE= && \
    echo "compress upx binary" && \
    /upx/src/upx.out \
        --lzma \
        -o /usr/bin/upx \
        /upx/src/upx.out && \
    echo "done building and compressing upx"

# final stage
FROM busybox

COPY --from=builder /usr/bin/upx /usr/bin/upx

ENTRYPOINT ["/usr/bin/upx"]
