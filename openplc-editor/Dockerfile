FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt update && apt install -y \
    git \
    sudo \
    libcanberra-gtk3-module \
    packagekit-gtk3-module

RUN git clone https://github.com/thiagoralves/OpenPLC_Editor.git && \
    cd OpenPLC_Editor && \
    echo "Installing OpenPLC Editor" && \
    echo "Please be patient. This may take a couple minutes..." && \
    echo "" && \
    echo "[INSTALLING DEPENDENCIES]" && \
    apt-get -y update && apt-get -y install \
        build-essential pkg-config bison flex autoconf automake libtool make \
        git libssl-dev python2.7 python-pip python-wxgtk3.0 && \
    pip2 install future zeroconf==0.19.1 numpy==1.16.5 matplotlib==2.0.2 lxml pyro sslpsk && \
    echo "" && \
    echo "[COMPILING MATIEC]" && \
    cd matiec && autoreconf -i && ./configure && make -s && \
    echo "" && \
    echo "[FINALIZING]" && \
    cd .. && \
    echo "#!/bin/bash" > openplc_editor.sh && \
    echo "cd \"/OpenPLC_Editor/editor\"" >> openplc_editor.sh && \
    echo "python2.7 Beremiz.py" >> openplc_editor.sh && \
    chmod +x ./openplc_editor.sh

ENV LC_ALL C.UTF-8

WORKDIR /OpenPLC_Editor

CMD ["./openplc_editor.sh"]