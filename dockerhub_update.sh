# build and push nmap-small to Docker Hub
docker buildx build --platform linux/amd64 -t sneakerhax/nmap-small -f Nmap-small/Dockerfile Nmap-small/ --push
# docker push sneakerhax/nmap-small:latest

# build and push nmap to Docker Hub
docker buildx build --platform linux/amd64 -t sneakerhax/nmap -f Nmap/Dockerfile Nmap/ --push
# docker push sneakerhax/nmap:latest

# build and push metasploit to Docker Hub
docker buildx build --platform linux/amd64 -t sneakerhax/metasploit -f Metasploit/Dockerfile Metasploit/ --push
# docker push sneakerhax/metasploit:latest

# build and push wordlists to Docker Hub
docker buildx build --platform linux/amd64 -t sneakerhax/wordlists -f Wordlists/Dockerfile Wordlists/ --push
# docker push sneakerhax/wordlists:latest