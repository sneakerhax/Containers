# build and push nmap-small to Docker Hub
docker build -t sneakerhax/nmap-small -f Nmap-small/Dockerfile Nmap-small/
docker push sneakerhax/nmap-small:latest

# build and push nmap to Docker Hub
docker build -t sneakerhax/nmap -f Nmap/Dockerfile Nmap/
docker push sneakerhax/nmap:latest

# build and push metasploit to Docker Hub
docker build -t sneakerhax/metasploit -f Metasploit/Dockerfile Metasploit/
docker push sneakerhax/metasploit:latest

# build and push wordlists to Docker Hub
docker build -t sneakerhax/wordlists -f Wordlists/Dockerfile Wordlists/
docker push sneakerhax/wordlists:latest