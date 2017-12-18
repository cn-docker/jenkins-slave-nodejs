FROM node:alpine
LABEL maintainer="Julian Nonino <noninojulian@outlook.com>"

ENV JAVA_VERSION 8u131
ENV JAVA_ALPINE_VERSION 8.131.11-r2

RUN apk add --no-cache git subversion mercurial wget curl unzip openssh ca-certificates procps bash openjdk8-jre="$JAVA_ALPINE_VERSION" && \
    rm -rf /var/cache/apk/*

ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk/jre
ENV PATH $JAVA_HOME/bin:$JAVA_HOME/lib:$PATH

RUN mkdir /ws
WORKDIR /ws

CMD ["/bin/sh"]
