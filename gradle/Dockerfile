FROM frolvlad/alpine-oraclejdk8
MAINTAINER Oliver Freeman <oliver.freeman@ndm.ox.ac.uk>

RUN apk update
RUN apk add curl

#Install Gradle
ENV GRADLE_VERSION 2.11

WORKDIR /usr/bin
RUN curl -sLO https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip && \
  unzip gradle-${GRADLE_VERSION}-bin.zip && \
  ln -s gradle-${GRADLE_VERSION} gradle && \
  rm gradle-${GRADLE_VERSION}-bin.zip

ENV GRADLE_HOME /usr/bin/gradle
ENV PATH $PATH:$GRADLE_HOME/bin

# Application directory
RUN mkdir -p /gradle

# Set Workdir
WORKDIR /gradle

# Set Default Behavior
ENTRYPOINT ["gradle"]