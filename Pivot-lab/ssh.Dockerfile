FROM ubuntu

RUN apt update && apt install openssh-server sudo net-tools -y 
RUN mkdir -p /run/sshd
RUN if ! id -u ubuntu >/dev/null 2>&1; then useradd -m -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 ubuntu; fi && echo 'ubuntu:ubuntu' | chpasswd
CMD ["/usr/sbin/sshd","-D"]