FROM anapsix/alpine-java:8_jdk
MAINTAINER Oliver Freeman <oliver.freeman@ndm.ox.ac.uk>

# Add bash capability
RUN apk update && \
    apk add bash curl

# Application directory
RUN mkdir -p /java
WORKDIR /java

# Default behaviour
ENTRYPOINT ["java"]
CMD ["-version"]