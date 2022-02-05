FROM docker:stable-dind

RUN apk add --no-cache git openssh-client vim tmux htop bash 
RUN apk update \
    && apk add --no-cache libffi-dev openssl-dev gcc g++ libc-dev rust cargo make \
    cmake alpine-sdk libressl-dev python3-dev py3-pip \
    && ln -s /usr/bin/python3 /usr/bin/python \
    && pip3 install --upgrade --no-cache-dir \
        pip \
        wheel \
        setuptools \
    && pip3 install --upgrade --no-cache-dir \
        docker-compose \
        awscli \
    && pip3 install --ignore-installed distlib poetry \
    && rm -rf /var/cache/apk/*

ARG SSH_PRIVATE_KEY
RUN mkdir /root/.ssh/ &&\
    echo "${SSH_PRIVATE_KEY}" > /root/.ssh/id_rsa &&\
    chmod 600 /root/.ssh/id_rsa &&\
    touch /root/.ssh/known_hosts &&\
    ssh-keyscan github.com >> /root/.ssh/known_hosts

ENV DOCKER_BUILDKIT 1
ENV PS1 '[\u@\h \W]\$'
COPY entrypoint.sh /usr/local/bin/my_entrypoint.sh
RUN chmod +x /usr/local/bin/my_entrypoint.sh
VOLUME /var/lib/docker
WORKDIR /root
