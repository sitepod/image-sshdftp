#!/bin/bash

set -e

# this is all dangerous and hacky due to reprovisioning of configmaps every sync period
# waiting on https://github.com/kubernetes/kubernetes/issues/4789

chown root.root /etc/passwd
chmod 644 /etc/passwd

chown root.root /etc/shadow
chmod 640 /etc/shadow

chown root.root /etc/group
chmod 644 /etc/group

chown root.root /etc/ssh/ssh_host_rsa_key
chmod 600 /etc/ssh/ssh_host_rsa_key
chown root.root /etc/ssh/ssh_host_rsa_key.pub
chmod 600 /etc/ssh/ssh_host_rsa_key.pub

if [ "$1" = '/usr/sbin/sshd' ]; then
    exec "$@"
fi

exec "$@"
