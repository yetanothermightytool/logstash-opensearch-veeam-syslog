FROM docker.elastic.co/logstash/logstash:8.17.0

# Remove default pipeline and config files
RUN rm -f /usr/share/logstash/pipeline/logstash.conf
RUN rm -f /usr/share/logstash/config/logstash-sample.conf

# Copy your pipeline and configuration files
COPY ./pipeline/ /usr/share/logstash/pipeline/
COPY ./config/ /usr/share/logstash/config/

# Install the Opensearch output plugin
RUN bin/logstash-plugin install logstash-output-opensearch
