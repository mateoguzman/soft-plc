FROM ubuntu:18.04

RUN apt update && apt install -y git 

RUN git clone https://github.com/thiagoralves/OpenPLC_v3.git && \
    cd OpenPLC_v3 && \
    ./install.sh docker

WORKDIR /OpenPLC_v3

CMD ["./start_openplc.sh"]