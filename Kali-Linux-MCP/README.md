# Docker - Kali Linux

A Dockerized version of Kali Linux by Offensive Security

## Building the image

```
docker build -t kalilinux .
```

## Running the container

```
docker run -it kalilinux /bin/bash
```

Running Docker container and entering bash shell

```
docker run -t -d kalilinux
```

Create persistent container

```
apt install -y <metapackage>
```

Install metapackage for specific tools MCP server will access

Kali Linux Metapackages: https://www.kali.org/docs/general-use/metapackages/
