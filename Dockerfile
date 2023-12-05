FROM ubuntu:latest

RUN apt-get update \
	&& apt install -y wget unzip \
	&& mkdir ~/karlsenwallet \
	&& cd ~/karlsenwallet \
	&& wget https://github.com/karlsen-network/karlsend/releases/download/v1.0.0/karlsend-v1.0.0-linux.zip \
	&& unzip karlsend-v1.0.0-linux.zip \
	&& chmod +x ./karlsenwallet ./karlsend \
	&& apt clean

WORKDIR /root/karlsenwallet

