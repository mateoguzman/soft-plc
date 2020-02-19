FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt update && apt install -y \
    git \
    sudo \
    libcanberra-gtk3-module \
    packagekit-gtk3-module

RUN git clone https://github.com/thiagoralves/OpenPLC_Editor.git && \
    cd OpenPLC_Editor && \
    ./install.sh

ENV LC_ALL C.UTF-8

WORKDIR /OpenPLC_Editor

CMD ["./openplc_editor.sh"]