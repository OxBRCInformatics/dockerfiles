# Credit to haraldkoch/alpine-tomcat7 this is the dockerfile but using
# oracle jre7 and 8 rather than openjdk
FROM oxbrcinformatics/java:jre8
MAINTAINER Oliver Freeman <oliver.freeman@ndm.ox.ac.uk>

RUN apk add --update curl ca-certificates

RUN mkdir -p /opt
ENV TOMCAT_MAJOR=8 \
    TOMCAT_VERSION=8.0.32 \
    TOMCAT_HOME=/opt/tomcat \
    CATALINA_HOME=/opt/tomcat

ENV PATH $PATH:$CATALINA_HOME/bin

RUN apk upgrade --update && \
    apk add --update curl && \
    curl -jksSL -o /tmp/apache-tomcat.tar.gz http://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_MAJOR}/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz && \
    gunzip /tmp/apache-tomcat.tar.gz && \
    tar -C /opt -xf /tmp/apache-tomcat.tar && \
    ln -s /opt/apache-tomcat-${TOMCAT_VERSION} ${TOMCAT_HOME} && \
    rm -rf ${TOMCAT_HOME}/webapps/* && \
    apk del curl && \
    rm -rf /tmp/* /var/cache/apk/*

COPY ./run.sh /usr/local/bin/run-tomcat
RUN chmod +x /usr/local/bin/*

EXPOSE 8080

VOLUME /opt/tomcat/logs

# override ENTRYPOINT defined in olliefreeman/java:jdk8
ENTRYPOINT [ "/bin/sh", "-c" ]
CMD ["/usr/local/bin/run-tomcat"]