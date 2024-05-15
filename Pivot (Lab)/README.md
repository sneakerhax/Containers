# Pivot - Lab

A Docker-compose lab environment to test pivoting

## Building using Docker-compose (Local build)

```
docker-compose up -d 
```

Build the lab (locally)

```
docker-compose down
```

Delete the lab (locally)

## SSH to the pivot host

```
ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -p2222 ubuntu@localhost
```

ssh to the pivot host (password "ubuntu")

```
ssh -D 9999 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -p2222 ubuntu@localhost
```

Create dynamic tunnel throught he pivot host (password "ubuntu")

```
proxychains4 nmap -p80 -sV -sT <ip_address_httpd_container>
```

Test the ability to see other service inside the network

```
curl -x http://127.0.0.1:9999  http://<ip_address_httpd_container>
```

Curl Apache host through pivot (requires proxychains4)

## References
* [Curl with socks proxy](https://everything.curl.dev/usingcurl/proxies/socks.html)