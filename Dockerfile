FROM docker.elastic.co/logstash/logstash:7.17.6
USER root
RUN apt-get update -y && apt-get install -y netbase

COPY ./data /home/data
RUN rm -f /usr/share/logstash/pipeline/logstash.conf
RUN /usr/share/logstash/bin/logstash-plugin install --version=3.1.5 logstash-output-mongodb

ADD pipeline/ /usr/share/logstash/pipeline/
ADD config/ /usr/share/logstash/config/
