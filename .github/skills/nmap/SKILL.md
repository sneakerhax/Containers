---
name: nmap
description: 'Run Nmap scans in Docker for a provided host, IP, or CIDR target.'
argument-hint: '<target> [optional nmap flags]'
user-invocable: true
---

# Nmap Docker Runner

Use this skill to run Nmap against a target from the existing container image.

## When to Use
- You want a quick Nmap scan from this repository's Docker image.
- You have a host, IP, or CIDR target to scan.
- You want to pass additional Nmap flags.

## Procedure
1. Get the scan target.
2. Run the command directly:

```bash
docker run -it sneakerhax/nmap <target>
```

3. If needed, include extra Nmap flags before the target:

```bash
docker run -it sneakerhax/nmap -sV -Pn <target>
```

## Notes
- Replace `<target>` with a hostname, IP, or CIDR.
- Keep scans authorized and within scope.
