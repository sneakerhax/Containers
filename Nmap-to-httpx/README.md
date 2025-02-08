# Nmap to httpx

A Dockerized tool for converting Nmap output to httpx input

## Running with Docker (Local Build)

```
docker build -t nmap-to-httpx .
```

Building the image (locally)

```
docker run -it -v $(pwd):/tmp nmap-to-httpx:latest -domain /tmp/test.xml
scanme.nmap.org:22
scanme.nmap.org:53
scanme.nmap.org:80
scanme.nmap.org:9929
scanme.nmap.org:31337
```
Running the Docker container getting httpx output with domain (use -ip for ip:port format)
