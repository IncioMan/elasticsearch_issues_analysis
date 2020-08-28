FROM adoptopenjdk/openjdk14
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git
RUN git clone https://github.com/elastic/elasticsearch.git && \
    cd elasticsearch
#RUN ./gradlew :server:test --tests org.apache.lucene.queries.DoubleRandomBinaryDocValuesRangeQueryTests
#VOLUME /elasticsearch/server/