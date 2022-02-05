FROM docker:stable-dind

RUN apk add --no-cache git openssh-client vim tmux htop bash 
RUN apk update && apk add --no-chache --repository http://dl-cdn.alpinelinux.org/alpine/v3.12/main python3-dev~=3.8 py3-pip \
    && apk add --no-cache libffi-dev openssl-dev gcc libc-dev rust cargo make \
    && ln -s /usr/bin/python3 /usr/bin/python \
    && pip3 install --upgrade pip \
    && pip3 install --upgrade --no-cache-dir \
        wheel \
        setuptools \
    && pip3 install --upgrade --no-cache-dir \
        docker-compose \
        awscli \
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
