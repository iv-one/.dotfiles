FROM ubuntu

RUN apt-get update && apt-get -y install \
  curl \
  sudo \
  unzip \
  xz-utils \
  wget

RUN useradd -ms /bin/bash jocker && echo "jocker:jocker" | chpasswd && adduser jocker sudo

ENV USER jocker

USER jocker
WORKDIR /home/jocker