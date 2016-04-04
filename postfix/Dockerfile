# Credit to juanluisbaptiste/docker-postfix this is the dockerfile but using
# linux-alpine rather than centos

#Dockerfile for a Postfix email relay service
FROM alpine:3.3
MAINTAINER James Welch <james.welch@ndm.ox.ac.uk>

#RUN yum install -y epel-release && yum update -y && \
#    yum install -y cyrus-sasl cyrus-sasl-plain cyrus-sasl-md5 mailx \
#    perl supervisor postfix

RUN apk add --update supervisor perl cyrus-sasl mailx postfix bash openrc icu-dev && \
    sed -i -e "s/^nodaemon=false/nodaemon=true/" /etc/supervisord.conf && \
    sed -i -e 's/inet_interfaces = localhost/inet_interfaces = all/g' /etc/postfix/main.cf

COPY run.sh /
COPY etc/supervisord.d/postfix.ini /etc/supervisor.d/

RUN chmod +x /run.sh && \
    newaliases

EXPOSE 25
#ENTRYPOINT ["/run.sh"]
CMD ["/run.sh"]


