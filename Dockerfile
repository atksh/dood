FROM docker:stable-dind

RUN apk add --no-cache git openssh-client vim tmux htop bash 
RUN apk update \
    && apk add --no-cache libffi-dev openssl-dev gcc libc-dev rust cargo make python3-dev py3-pip \
    && pip3 install --upgrade --no-cache-dir \
        pip \
        wheel \
        setuptools \
    && pip3 install --upgrade --no-cache-dir \
        docker-compose \
        awscli \
    && pip3 install --ignore-installed distlib poetry \
    && rm -rf /var/cache/apk/*

RUN mkdir /root/.ssh/ &&\
    touch /root/.ssh/known_hosts &&\
    ssh-keyscan github.com >> /root/.ssh/known_hosts

ENV DOCKER_BUILDKIT 1
ENV PS1 '[\u@\h \W]\$'
COPY entrypoint.sh /usr/local/bin/my_entrypoint.sh
RUN chmod +x /usr/local/bin/my_entrypoint.sh
VOLUME /var/lib/docker
WORKDIR /root
