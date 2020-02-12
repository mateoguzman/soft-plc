FROM ubuntu:18.04

RUN apt update && apt install -y git sudo

RUN git clone https://github.com/thiagoralves/ScadaBR_Installer.git && \
    cd ScadaBR_Installer && \
    ./install_scadabr.sh

CMD ["/opt/tomcat6/apache-tomcat-6.0.53/bin/catalina.sh", "run"]