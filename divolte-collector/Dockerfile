
FROM dcd/alpine-hadoop

USER root

ENV DIVOLTE_VERSION="0.4.0-SNAPSHOT"
ENV DIVOLTE_CONF_DIR /etc/divolte-collector

ADD divolte-collector-${DIVOLTE_VERSION}.tar /opt

RUN chown -R $USER:$GROUP /opt/divolte-collector-${DIVOLTE_VERSION} && \ 
	ln -s /opt/divolte-collector-${DIVOLTE_VERSION} /opt/divolte-collector

COPY divolte-docker.sh /

USER $USER

VOLUME ["/etc/divolte-collector"]
EXPOSE 8290

CMD /divolte-docker.sh
