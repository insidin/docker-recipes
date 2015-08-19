FROM dcd/alpine-java

USER root

ENV HADOOP_VERSION 2.7.1
ENV HADOOP_PREFIX /opt/hadoop
ENV HADOOP_CONF_DIR $HADOOP_PREFIX/conf
ENV PATH $PATH:$JAVA_HOME/bin:$HADOOP_PREFIX/bin:$HADOOP_PREFIX/sbin

RUN curl -Ls http://archive.apache.org/dist/hadoop/core/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz | tar -xzf - -C /opt &&\
	chown -R $USER:$GROUP /opt/hadoop-$HADOOP_VERSION &&\
	ln -s /opt/hadoop-$HADOOP_VERSION $HADOOP_PREFIX

VOLUME /shared

ADD conf/* $HADOOP_CONF_DIR/

USER $USER