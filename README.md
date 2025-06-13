Containers

Leveraging container technologies to build Red Team tools

[![Python 3.7+](https://img.shields.io/badge/python-3.7+-FADA5E.svg?logo=python)](https://www.python.org/) [![golang](https://img.shields.io/badge/golang-1.17+-29BEB0.svg?logo=GO)](https://go.dev/)
[![Docker](https://img.shields.io/badge/docker-required-0db7ed.svg?logo=docker)](https://www.docker.com/) [![PEP8](https://img.shields.io/badge/code%20style-pep8-red.svg)](https://www.python.org/dev/peps/pep-0008/) [![License](https://img.shields.io/badge/license-GPL3-lightgrey.svg)](https://www.gnu.org/licenses/gpl-3.0.en.html) [![Twitter](https://img.shields.io/badge/twitter-sneakerhax-38A1F3?logo=twitter)](https://twitter.com/sneakerhax)

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
