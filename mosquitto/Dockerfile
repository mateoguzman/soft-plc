FROM eclipse-mosquitto:latest

VOLUME [ "/mosquitto/config" ]

COPY ./config /mosquitto/config

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD mosquitto_sub -h 127.0.0.1 -p 1883 -t test -E || exit 1

USER mosquitto
