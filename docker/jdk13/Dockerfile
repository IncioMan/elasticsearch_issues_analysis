FROM adoptopenjdk:13.0.2_8-jdk-openj9-0.18.0-bionic
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git && \
    useradd -ms /bin/bash alex
USER alex
RUN cd && git clone https://github.com/elastic/elasticsearch.git
WORKDIR /home/alex/elasticsearch
RUN mkdir /home/alex/tmp
RUN mkdir /home/alex/elasticsearch/.gradle
RUN mkdir /home/alex/.gradle