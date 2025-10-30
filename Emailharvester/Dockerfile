FROM python:alpine

RUN apk -U upgrade && apk add git
RUN git clone https://github.com/maldevel/EmailHarvester
WORKDIR /EmailHarvester
RUN pip install -r requirements.txt

WORKDIR /EmailHarvester
ENTRYPOINT ["python", "EmailHarvester.py"]
