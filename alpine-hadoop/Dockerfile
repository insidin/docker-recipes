FROM insidin/alpine-java

USER root

ENV GROUP hadoop
ENV HADOOP_USER hadoop
ENV HADOOP_VERSION 2.7.1
ENV HADOOP_PREFIX /opt/hadoop
ENV PATH $PATH:$JAVA_HOME/bin:$HADOOP_PREFIX/bin:$HADOOP_PREFIX/sbin
ENV HADOOP_CONF_DIR $HADOOP_PREFIX/etc/hadoop
ENV HADOOP_LOG_DIR /shared/logs/hadoop
ENV YARN_LOG_DIR /shared/logs/yarn
ENV HADOOP_MAPRED_LOG_DIR /shared/logs/mapred
ENV USER root

#ADD scripts/* /

RUN curl -Ls http://archive.apache.org/dist/hadoop/core/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz | tar -xzf - -C /opt &&\
	addgroup -S $GROUP -g 50 && \
    adduser -S $HADOOP_USER -G $GROUP -u 1000 && \
	ln -s /opt/hadoop-$HADOOP_VERSION $HADOOP_PREFIX &&\
	rm -Rf /opt/hadoop-$HADOOP_VERSION/share/doc &&\
	find /opt/hadoop-$HADOOP_VERSION/share/ -name "*-sources.jar" -type f -delete &&\
	find /opt/hadoop-$HADOOP_VERSION/share/ -name "*-tests.jar" -type f -delete &&\
	chown -R root:$GROUP /opt/hadoop* &&\
#	chmod 700 /*.sh &&\
	chmod 4700 /opt/hadoop-$HADOOP_VERSION/bin/container-executor 

ADD conf/* $HADOOP_CONF_DIR/

VOLUME /shared
VOLUME /data
