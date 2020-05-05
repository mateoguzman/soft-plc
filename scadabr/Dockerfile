FROM ubuntu:18.04

RUN apt update && apt install -y git sudo curl

RUN git clone https://github.com/thiagoralves/ScadaBR_Installer.git && \
    cd ScadaBR_Installer && \
    ./install_scadabr.sh

RUN useradd -ms /bin/bash scadabr

RUN chown scadabr /opt/tomcat6/apache-tomcat-6.0.53/ -R

USER scadabr

WORKDIR /opt/tomcat6/apache-tomcat-6.0.53/work

HEALTHCHECK --interval=30s --timeout=30s --start-period=15s --retries=3 \
    CMD curl -sSf http://127.0.0.1:9090/ScadaBR || exit 1

CMD ["/opt/tomcat6/apache-tomcat-6.0.53/bin/catalina.sh", "run"]