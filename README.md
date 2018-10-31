# Jenkins Slave Node.js #

Jenkins Slave for Node.js builds. Docker image based on Node.js official image.

	https://hub.docker.com/r/jnonino/jenkins-slave-nodejs/

## Docker Image Tags ##

-	[`latest` (*latest/Dockerfile*)](https://bitbucket.org/jnonino-devops-cloud/jenkins-slave-node.js/src/master/latest/Dockerfile)
-	[`8-alpine` (*8-alpine/Dockerfile*)](https://bitbucket.org/jnonino-devops-cloud/jenkins-slave-node.js/src/master/8-alpine/Dockerfile)
-	[`10-alpine` (*10-alpine/Dockerfile*)](https://bitbucket.org/jnonino-devops-cloud/jenkins-slave-node.js/src/master/10-alpine/Dockerfile)

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