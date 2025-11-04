# Socat HTTP Redirector

A Dockerized Socat HTTP redirector based on the socat for HTTP section of bluscreenofjeff's Red Team Infrastructure Wiki

## Build image

```
docker build -t socat-http-redirector .
```

First replace <ip_address> with the address to redirect traffic


## Running the container

```
docker run -d -p 80:80 socat-http-redirector
```

## References

* [Red Team Infrastructure Wiki - socat for HTTP](https://github.com/bluscreenofjeff/Red-Team-Infrastructure-Wiki#socat-for-http)
