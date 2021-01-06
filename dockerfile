FROM python:3.7
RUN pip install salt-ssh && \
    mkdir -p /etc/salt && \
    mkdir -p /srv/salt/salt-ssh
COPY roster /etc/salt/roster
COPY /states /srv/salt/salt-ssh
ENTRYPOINT ["/bin/bash"]