FROM insidin/alpine-hadoop

USER root

ENV SCALA_VERSION="2.10.4"
ENV CONFLUENT_VERSION="1.0"
ENV CONFLUENT_HOME=/opt/confluent

ADD confluent-${CONFLUENT_VERSION}-${SCALA_VERSION}.tar.gz /opt

RUN	chown -R $USER:$GROUP /opt/confluent-${CONFLUENT_VERSION} && \ 
	ln -s /opt/confluent-${CONFLUENT_VERSION} ${CONFLUENT_HOME}

USER $USER

ENV PATH ${PATH}:${CONFLUENT_HOME}/bin:$

