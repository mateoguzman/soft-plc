FROM alpine:3.10 as opcua-dev

RUN apk add --no-cache cmake gcc git g++ musl-dev mbedtls-dev python py-pip make && rm -rf /var/cache/apk/*

WORKDIR /opt

RUN git clone https://github.com/open62541/open62541.git && \
    cd open62541 && \
    git fetch -f --tags && \
    git remote add kalcito https://github.com/opcua-tsn-team-kalycito/open62541.git && \
    git fetch kalcito && \
    git checkout Standalone_mqtt_subscriber && \
    git config user.name "Your Name" && \
    git config user.email "you@example.com" && \
    git merge master && \
    git submodule update --init --recursive

WORKDIR /opt/open62541/build

RUN cmake -DBUILD_SHARED_LIBS=OFF \
        -DCMAKE_BUILD_TYPE=Debug \
        -DUA_BUILD_EXAMPLES=ON \
        -DUA_ENABLE_PUBSUB=ON \
        -DUA_ENABLE_PUBSUB_MQTT=ON \
        -DUA_ENABLE_JSON_ENCODING=ON \
        -DUA_ENABLE_HARDENING=OFF \
        -DUA_ENABLE_ENCRYPTION=ON \
        -DUA_ENABLE_SUBSCRIPTIONS=ON \
        -DUA_ENABLE_SUBSCRIPTIONS_EVENTS=ON \
        -DUA_NAMESPACE_ZERO=FULL \
        /opt/open62541 && \
    make -j $(nproc) && \
    make install

COPY ./examples /root/examples

RUN cd /root/examples && make all

CMD sh

FROM alpine:3.10 as opcua-mqtt-publish

RUN addgroup -S opcua && adduser -S -G opcua opcua

COPY --from=opcua-dev --chown=opcua \
    /lib/ld-musl-x86_64.so.1 \
    /usr/lib/libmbedx509.so.0 \
    /usr/lib/libmbedcrypto.so.3 \
    /usr/lib/libgcc_s.so.1 \
    /usr/lib/

COPY --from=opcua-dev --chown=opcua \
    /root/examples/tutorial_pubsub_mqtt_publish \
    /home/opcua/examples/tutorial_pubsub_mqtt_publish

ENTRYPOINT [ "/home/opcua/examples/tutorial_pubsub_mqtt_publish" ]

FROM alpine:3.10 as opcua-mqtt-subscribe

RUN addgroup -S opcua && adduser -S -G opcua opcua

COPY --from=opcua-dev --chown=opcua \
    /lib/ld-musl-x86_64.so.1 \
    /usr/lib/libmbedx509.so.0 \
    /usr/lib/libmbedcrypto.so.3 \
    /usr/lib/libgcc_s.so.1 \
    /usr/lib/

COPY --from=opcua-dev --chown=opcua \
    /root/examples/tutorial_pubsub_mqtt_subscribe \
    /home/opcua/examples/tutorial_pubsub_mqtt_subscribe

ENTRYPOINT [ "/home/opcua/examples/tutorial_pubsub_mqtt_subscribe" ]