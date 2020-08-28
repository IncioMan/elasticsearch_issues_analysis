FROM adoptopenjdk:13.0.2_8-jdk-openj9-0.18.0-bionic
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git
RUN git clone https://github.com/elastic/elasticsearch.git && \
    cd elasticsearch
#RUN ./gradlew :server:test --tests org.apache.lucene.queries.DoubleRandomBinaryDocValuesRangeQueryTests
#VOLUME /elasticsearch/server/