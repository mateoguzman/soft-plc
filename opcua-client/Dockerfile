FROM alpine:3.10

RUN apk add --no-cache cmake gcc git g++ musl-dev mbedtls-dev python py-pip make && rm -rf /var/cache/apk/*

WORKDIR /opt

RUN git clone https://github.com/open62541/open62541.git && \
    cd open62541 && \
    git fetch -f --tags && \
    git submodule update --init --recursive

WORKDIR /opt/open62541/build

RUN cmake -DBUILD_SHARED_LIBS=ON \
		-DCMAKE_BUILD_TYPE=Debug \
		-DUA_BUILD_EXAMPLES=ON \
		-DUA_ENABLE_HARDENING=OFF \
        -DUA_ENABLE_ENCRYPTION=ON \
        -DUA_ENABLE_SUBSCRIPTIONS=ON \
        -DUA_ENABLE_SUBSCRIPTIONS_EVENTS=ON \
		-DUA_NAMESPACE_ZERO=FULL \
         /opt/open62541 && \
    make -j && \
    make install

WORKDIR /root

COPY ./client.c /root/client.c

RUN gcc -std=c99 -DUA_ARCHITECTURE_POSIX client.c -o client -lopen62541

ENV LD_LIBRARY_PATH=/usr/local/lib64

CMD ["/root/client"]