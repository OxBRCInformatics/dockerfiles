FROM frolvlad/alpine-oraclejdk8:latest

# Add bash capability
RUN apk update
RUN apk add bash curl

# Application directory
RUN mkdir -p /java
WORKDIR /java

# Default behaviour
ENTRYPOINT ["java"]
CMD ["-version"]