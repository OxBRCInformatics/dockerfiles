FROM oxbrcinformatics/java:jdk8
MAINTAINER Oliver Freeman <oliver.freeman@ndm.ox.ac.uk>

# Install Grails
ENV GRAILS_VERSION 3.1.1

WORKDIR /usr/lib/jvm
RUN curl -LO https://github.com/grails/grails-core/releases/download/v$GRAILS_VERSION/grails-$GRAILS_VERSION.zip && \
    unzip grails-$GRAILS_VERSION.zip && \
    rm -rf grails-$GRAILS_VERSION.zip && \
    ln -s grails-$GRAILS_VERSION grails

# Setup Grails path.
ENV GRAILS_HOME /usr/lib/jvm/grails
ENV PATH $GRAILS_HOME/bin:$PATH

# Set Workdir
WORKDIR /

# Create a test app inside the working directory
RUN grails create-app grails
WORKDIR /grails

# Set Default Behavior
ENTRYPOINT ["grails"]
CMD ["run-app"]