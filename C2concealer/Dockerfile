FROM kalilinux/kali-rolling
RUN apt-get update

RUN apt-get -y install git
RUN git clone https://github.com/FortyNorthSecurity/C2Concealer /C2concealer
RUN cd /C2concealer
WORKDIR /C2concealer
RUN ./install.sh
ENTRYPOINT [ "C2concealer" ]