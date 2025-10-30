FROM python:alpine

RUN apk -U upgrade && apk add git
RUN git clone https://github.com/fgeek/pyfiscan.git && cd pyfiscan
RUN pip3 install -r pyfiscan/requirements.lst
WORKDIR /pyfiscan

ENTRYPOINT ["python", "pyfiscan.py"]
