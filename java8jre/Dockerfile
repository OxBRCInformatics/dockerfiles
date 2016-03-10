FROM develar/java:latest
MAINTAINER Oliver Freeman <oliver.freeman@ndm.ox.ac.uk>

# Add bash capability
RUN apk update && \
    apk add bash

# Application directory
RUN mkdir -p /java
WORKDIR /java

# Default behaviour
ENTRYPOINT ["java"]
CMD ["-version"]