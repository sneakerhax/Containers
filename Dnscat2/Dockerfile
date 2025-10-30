FROM kalilinux/kali-rolling

RUN apt-get update && apt-get upgrade -y
RUN apt install -y dnscat2 sudo

ENTRYPOINT [ "dnscat2-server" ]
CMD [ "--help" ]