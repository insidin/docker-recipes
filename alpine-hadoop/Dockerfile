FROM insidin/alpine-java

USER root

ENV GROUP hadoop
ENV HADOOP_USER hadoop
ENV HADOOP_VERSION 2.7.1
ENV HADOOP_PREFIX /opt/hadoop
ENV HADOOP_CONF_DIR $HADOOP_PREFIX/etc/hadoop
ENV PATH $PATH:$JAVA_HOME/bin:$HADOOP_PREFIX/bin:$HADOOP_PREFIX/sbin:/
ENV USER $HADOOP_USER
ENV HOST_MAPPING_DIR /shared
ENV DATA_MAPPING_DIR /data

ADD scripts/* /

#ADD hadoop-$HADOOP_VERSION.tar.gz /opt
RUN curl -Ls http://archive.apache.org/dist/hadoop/core/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz | tar -xzf - -C /opt &&\
	addgroup -S $GROUP -g 50 && \
    adduser -S $HADOOP_USER -G $GROUP -u 1000 && \
	ln -s /opt/hadoop-$HADOOP_VERSION $HADOOP_PREFIX &&\
	rm -Rf /opt/hadoop-$HADOOP_VERSION/share/doc &&\
	find /opt/hadoop-$HADOOP_VERSION/share/ -name "*-sources.jar" -type f -delete &&\
	find /opt/hadoop-$HADOOP_VERSION/share/ -name "*-tests.jar" -type f -delete &&\
	chown -R root:$GROUP /opt/hadoop* /*.sh &&\
	chmod -R 750 /opt/hadoop* /*.sh &&\
	chmod 4770 /opt/hadoop-$HADOOP_VERSION/bin/container-executor 

ADD conf/* $HADOOP_CONF_DIR/

#TODO expose ports here
# Hdfs ports
#EXPOSE 8020 50010 50020 50070 50075 50090 50091
# Mapred ports
#EXPOSE 10020 19888
#Yarn ports
#EXPOSE 8030 8031 8032 8033 8040 8042 8088
  
VOLUME $HOST_MAPPING_DIR
VOLUME $DATA_MAPPING_DIR

ENTRYPOINT ["./execute.sh"] 