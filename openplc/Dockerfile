FROM ubuntu:18.04

RUN apt update && apt install -y git 

RUN useradd -ms /bin/bash openplc

WORKDIR /home/openplc

RUN git clone https://github.com/thiagoralves/OpenPLC_v3.git && \
    cd OpenPLC_v3 && \
    ./install.sh docker

RUN chown openplc /home/openplc -R

USER openplc

WORKDIR /home/openplc/OpenPLC_v3

COPY ./healthcheck.py /home/openplc/OpenPLC_v3/healthcheck.py

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD python /home/openplc/OpenPLC_v3/healthcheck.py

CMD  /home/openplc/OpenPLC_v3/start_openplc.sh