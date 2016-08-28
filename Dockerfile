FROM alpine:3.1

RUN apk add --update openssh bash zsh build-base git vim rsync && \
  rm -rf /var/cache/apk/* 

RUN rm -f /etc/ssh/ssh_host_rsa_key && ln -s /etc/sitepod/ssh/ssh_host_rsa_key /etc/ssh/ssh_host_rsa_key
RUN rm -f /etc/ssh/ssh_host_rsa_key.pub && ln -s /etc/sitepod/ssh/ssh_host_rsa_key.pub /etc/ssh/ssh_host_rsa_key.pub
RUN rm -f /etc/ssh/sshd_config && ln -s /etc/sitepod/ssh/sshd_config /etc/ssh/sshd_config
RUN rm -f /etc/passwd && ln -s /etc/sitepod/etc/passwd /etc/passwd
RUN rm -f /etc/shadow && ln -s /etc/sitepod/etc/shadow /etc/shadow
RUN rm -f /etc/group && ln -s /etc/sitepod/etc/group /etc/group

COPY ./launch.sh /

ENTRYPOINT ["/launch.sh"]
CMD ["/usr/sbin/sshd","-D"]
