FROM ubuntu:18.04

RUN apt update && apt install -y git sudo

RUN git clone https://github.com/thiagoralves/OpenPLC_Editor.git && \
    cd OpenPLC_Editor && \
    ./install.sh

WORKDIR /OpenPLC_Editor

CMD ["./openplc_editor.sh"]