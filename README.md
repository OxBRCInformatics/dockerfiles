# Dockerfiles

Some general dockerfiles

For lightweightness we use [`frolvlad/alpine-oraclejdk8`](https://hub.docker.com/r/frolvlad/alpine-oraclejdk8/) as the base which is an
[Alpine Linux](http://alpinelinux.org/) installation with a `cleaned` JDK 8 installed.

## Gradle

Default is currently Gradle 2.11 but setting environment variable GRADLE_VERSION will override this.
Working directory is `/gradle`

## Grails

Default is currently Grails 3.1.1 but setting environment variable GRAILS_VERSION will override this.
Working directort is `/grails`
