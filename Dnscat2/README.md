# Docker - Dnscat2 (Kali Linux)

A Dockerized version of Dnscat2 by iagox86

## Building the image

```
docker build -t dnscat2 .
```

Building the dnscat2 image. The server and client build architecture will match the operating system of the container host

```
docker buildx build --platform=linux/amd64 -t dnscat2-amd64 .
```

Building the dnscat2 image for linux/amd64

## Running the container

```
docker run -it dnscat2
```

Running Docker container default will print the help of the dnscat2-server
