FROM ubuntu

RUN apt update && apt install openssh-server sudo net-tools -y 
RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 ubuntu && echo 'ubuntu:ubuntu' | chpasswd
RUN usermod -aG sudo ubuntu
RUN service ssh start
CMD ["/usr/sbin/sshd","-D"]