FROM centos:7

ARG SERVER_NAME=go-learning

ENV WORKDIR /data/home/swimmingswam/${SERVER_NAME}

WORKDIR ${WORKDIR}

COPY ./build .

RUN chmod +x bin/*

ENTRYPOINT ["/bin/bash", "-c", "${WORKDIR}/bin/start.sh"]