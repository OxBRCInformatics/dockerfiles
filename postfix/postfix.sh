#!/bin/bash
echo -------------------------------------------------------------------------------

# Set the mydomain to the environment defined value
[ -n "${DOMAIN}" ] && echo "Setting domain name to '${DOMAIN}'" && postconf mydomain=${DOMAIN}

# Set the server hostname to the environment defined value
[ -n "${SERVER_HOSTNAME}" ] &&  echo "Setting hostname name to '${SERVER_HOSTNAME}'" && postconf myhostname=${SERVER_HOSTNAME}

# If SMTP_SERVER set the check other variables
# default is  'relayhost =   ' which just forwards out
if [ -n "${SMTP_SERVER}" ]
then
    echo "SMTP_SERVER defined as ${SMTP_SERVER}"
    [ -z "${SMTP_USERNAME}" ] && echo "SMTP_SERVER set but no SMTP_USERNAME is set" && exit 2
    [ -z "${SMTP_PASSWORD}" ] && echo "SMTP_SERVER set but no SMTP_PASSWORD is set" && exit 2

    echo "Setting SASL authentication for user ${SMTP_USERNAME}"
    postconf relayhost=[${SMTP_SERVER}]:587 \
        smtp_sasl_auth_enable=yes \
        smtp_sasl_password_maps=hash:/etc/postfix/sasl_passwd \
        smtp_sasl_security_options=noanonymous
    echo "[${SMTP_SERVER}]:587 ${SMTP_USERNAME}:${SMTP_PASSWORD}" >> /etc/postfix/sasl_passwd
fi


# Start postfix
echo "Starting Postfix"
postfix -c /etc/postfix start

# Catch any errors in failing to start
rc=$?
if [[ $rc != 0 ]]; then exit $rc; fi

# Tail the mail log for this process
echo "Postfix started, tailing log"
tail -f /var/log/mail.log