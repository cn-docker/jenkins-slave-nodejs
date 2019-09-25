FROM node:alpine
LABEL maintainer="CN Services <noninojulian@gmail.com>"

RUN apk add --no-cache git subversion mercurial wget curl unzip openssh ca-certificates procps bash openjdk8 && \
    rm -rf /var/cache/apk/*

ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk
ENV PATH $JAVA_HOME/bin:$JAVA_HOME/lib:$PATH

RUN addgroup -S -g 10000 jenkins && \
    adduser -S -u 10000 -h /home/jenkins -G jenkins jenkins

USER jenkins
WORKDIR /home/jenkins

CMD ["/bin/sh"]
