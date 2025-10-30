FROM kalilinux/kali-rolling
EXPOSE 80
RUN apt update && apt upgrade -y
RUN apt install socat -y

ENTRYPOINT [ "socat", "TCP4-LISTEN:80,fork,reuseaddr", "TCP4:<ip_address>:81" ]
