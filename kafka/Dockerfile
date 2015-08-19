
FROM dcd/alpine-confluent

USER root

RUN mkdir -p /var/lib/kafka /var/log/kafka && \
    chown -R $USER:$GROUP /var/lib/kafka /var/log/kafka ${CONFLUENT_HOME}/etc/kafka/server.properties 

COPY kafka-statsd-metrics2-0.4.0-all.jar ${CONFLUENT_HOME}/share/java/kafka/kafka-statsd-metrics2-0.4.0-all.jar

COPY kafka-docker.sh /

USER $USER

VOLUME ["/var/lib/kafka", "/var/log/kafka"]
EXPOSE 9092

CMD /kafka-docker.sh
