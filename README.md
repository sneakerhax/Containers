# Arsenal Containers

Leveraging container technologies to build Red Team tools

## Containerized Red Team Tools

Containers are an effective way to configure, deploy, and use Red Team tools. 

Containerizing Red Team tools provides the following benefits:

* Consistent setup and configuration (Single command builds)
* Documented setup process (Dockerfiles)
* Deployable to cloud services (e.g. recon scans, c2 infra, team services)

For more information on setting up Docker check out [Arsenal/Tools/Docker](https://github.com/sneakerhax/Arsenal/blob/main/Tools/Docker/README.md)

## Docker (Building and Running locally)

```
docker build -t <image_name> <tool_directory>
```

Building one of the tools using the Dockerfile in each tool directory

```
docker run -it <image_name> <arguments>
```
Running the tool after building the image

## Images

* C2concealer
* Dirbpy
* Dirsearch
* Emailharvester
* FFuF
* HardCIDR
* Infra
    * socat-http-redirector
* Java (OpenJDK)
* Kali-Linux
* Linode_cli
* Metasploit
* Metasploit Nightly Installer (deprecated)
* Ncrack
* Ngrok (instructions only)
* Nmap (Includes ncrack)
* Nmap-small
* Pivot-lab
* PyDNSRecon-Deprecated
* PyDNSRecon-Passive-Deprecated
* PyDNSRecon-m1-Deprecated
* Pyfiscan
* PyReconer-Deprecated
* Searchsploit
* Shodan
* Ultra-Recon
* WhatWeb
* Wordlists

## Docker Hub

Tools Containerized through autobuilds on Docker Hub can be found [here](https://hub.docker.com/u/sneakerhax)

```
docker run it sneakerhax\<image_name> <arguments>
```
Running a tool listed on Docker Hub
