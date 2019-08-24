# Jenkins Slave Node.js

[![](https://img.shields.io/docker/pulls/jnonino/jenkins-slave-nodejs.svg)](https://hub.docker.com/r/jnonino/jenkins-slave-nodejs/)
[![](hhttps://img.shields.io/docker/build/jnonino/jenkins-slave-nodejs)](https://hub.docker.com/r/jnonino/jenkins-slave-nodejs/)
[![](https://img.shields.io/docker/automated/jnonino/jenkins-slave-nodejs)](https://hub.docker.com/r/jnonino/jenkins-slave-nodejs/)
[![](https://img.shields.io/docker/stars/jnonino/jenkins-slave-nodejs)](https://hub.docker.com/r/jnonino/jenkins-slave-nodejs/)
[![](https://img.shields.io/github/license/jnonino/jenkins-slave-nodejs-docker-image)](https://github.com/jnonino/jenkins-slave-nodejs-docker-image)
[![](https://img.shields.io/github/issues/jnonino/jenkins-slave-nodejs-docker-image)](https://github.com/jnonino/jenkins-slave-nodejs-docker-image)
[![](https://img.shields.io/github/issues-closed/jnonino/jenkins-slave-nodejs-docker-image)](https://github.com/jnonino/jenkins-slave-nodejs-docker-image)
[![](https://img.shields.io/github/languages/code-size/jnonino/jenkins-slave-nodejs-docker-image)](https://github.com/jnonino/jenkins-slave-nodejs-docker-image)
[![](https://img.shields.io/github/repo-size/jnonino/jenkins-slave-nodejs-docker-image)](https://github.com/jnonino/jenkins-slave-nodejs-docker-image)

Jenkins Slave for Node.js builds. Docker image based on Node.js official image.

## Tools Installed ##

- Node.js
- Open Java JRE
- Git
- Subversion
- Mercurial
- wget
- curl
- unzip
- OpenSSH
- CA Certificates

## Add certificate to connect to HTTPS repositories

To add custom certificates and root CAs, create a new Dockerfile and import them with the following code.

	FROM jnonino/jenkins-slave-nodejs
	LABEL maintainer="Julian Nonino <noninojulian@gmail.com>"

	# Trust Root CA
	COPY Root_CA.crt /tmp
	RUN keytool -importcert -alias Root_CA -keystore ${JAVA_HOME}/jre/lib/security/cacerts -storepass changeit -file /tmp/Root_CA.crt -noprompt && \
		cp /tmp/Root_CA.crt /usr/local/share/ca-certificates/ && \
		chmod 644 /usr/local/share/ca-certificates/Root_CA.crt && \
		update-ca-certificates && \
		npm config set cafile="/etc/ssl/certs/ca-certificates.crt" && \

	CMD ["/bin/bash"]
