
FROM dcd/alpine-hadoop

USER root

ENV SCALA_VERSION="2.10.4"
ENV CONFLUENT_VERSION="1.0"
ENV CONFLUENT_HOME=/opt/confluent

ADD confluent-${CONFLUENT_VERSION}-${SCALA_VERSION}.tar.gz /opt

#RUN mkdir -p /etc/confluent && \
#	curl -nvO -H 'Cache-Control: no-cache' http://packages.confluent.io/archive/1.0/confluent-${CONFLUENT_VERSION}-${SCALA_VERSION}.tar.gz | tar -xzf - -C /opt && \ 

RUN	chown -R $USER:$GROUP /opt/confluent-${CONFLUENT_VERSION} && \ 
	ln -s /opt/confluent-${CONFLUENT_VERSION} ${CONFLUENT_HOME}

USER $USER

ENV PATH ${PATH}:${CONFLUENT_HOME}/bin:$

