# VS Code has issues connecting to remote docker host using docker compose
# https://github.com/docker/compose/issues/6336
# https://github.com/docker/compose/issues/6513#issuecomment-613358317
# https://github.com/paramiko/paramiko/issues/1383
# https://github.com/docker/docker-py/pull/2290
# https://github.com/docker/docker-py/pull/2448
# https://www.docker.com/blog/how-to-deploy-on-remote-docker-hosts-with-docker-compose/ 

# Choose images from https://www.balena.io/docs/reference/base-images/base-images/
FROM balenalib/armv7hf-python:3-latest

RUN apt-get update && \
    # apt-get upgrade && \
    apt-get -y install \
                curl \
                # git, process tools, lsb-release (common in install instructions for CLIs) installed
                git openssh-client zip vim less iproute2 procps lsb-release upx file make \
                build-essential \
                libstdc++6 \
                # SSL dependencies
                apt-transport-https ca-certificates gnupg2

# Docker installation
RUN \
    # Install Docker CE CLI (and engine) and docker-compose (avoid 19.03.11 as it has a bug propagating ssh credentials)
    curl -fsSL https://get.docker.com -o get-docker.sh \
    && sh get-docker.sh \
    && rm get-docker.sh \
    && apt-get install -y docker-compose

# Clean up
RUN apt-get autoremove -y && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/* /tmp/gotools

RUN pip install --upgrade pip

# Project specific library installations
RUN pip install rpi.gpio pylint
