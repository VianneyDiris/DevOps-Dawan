#!/usr/bin/env bash
apt update \
    && apt install -y rsyslog \
    && service rsyslog start \
    && logger "initialisation syslog" \
    && chmod 644 /var/log/syslog \
    && while true; do logger "Message de test $(date)"; sleep 1; done