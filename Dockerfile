FROM debian:buster

RUN apt-get update && \
    apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg && \
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

RUN apt-get update && \
    apt-get install -y docker-ce docker-ce-cli containerd.io && \
    curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose

# CUSTOM
RUN apt-get update && \
    apt-get install -y \
    git \
    openssh-client \
    vim \
    tmux \
    htop \
    iptraf-ng \
    python3-pip && \
    pip3 install awscli --upgrade && \
    apt-get install -y awscli

ENV SSH_AUTH_SOCK /tmp/ssh-agent.sock
WORKDIR /work
ENTRYPOINT /bin/bash
