FROM adoptopenjdk/openjdk14
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git && \
    useradd -ms /bin/bash alex
USER alex
RUN cd && git clone https://github.com/elastic/elasticsearch.git
WORKDIR /home/alex/elasticsearch
RUN mkdir /home/alex/.gradle
