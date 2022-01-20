FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get -y install gcc make lsb-core sudo=1.8.31-1ubuntu1
RUN useradd -u 5000 poc && mkdir -p /home/exploit && chown -R poc:poc /home/exploit

WORKDIR /home/exploit

COPY exploit.c .
COPY shellcode.c .
COPY Makefile .
RUN make

USER poc
CMD ["/bin/bash"]
