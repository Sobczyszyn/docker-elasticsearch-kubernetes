FROM quay.io/pires/docker-elasticsearch:5.1.1_1

MAINTAINER pjpires@gmail.com

# Override elasticsearch.yml config, otherwise plug-in install will fail
ADD do_not_use.yml /elasticsearch/config/elasticsearch.yml

# Install Elasticsearch plug-ins
RUN /elasticsearch/bin/elasticsearch-plugin install io.fabric8:elasticsearch-cloud-kubernetes:5.1.1 --verbose
RUN /elasticsearch/bin/elasticsearch-plugin install analysis-icu --verbose

# Override elasticsearch.yml config, otherwise plug-in install will fail
ADD elasticsearch.yml /elasticsearch/config/elasticsearch.yml

# Set environment
ENV NAMESPACE default
ENV DISCOVERY_SERVICE elasticsearch-discovery
