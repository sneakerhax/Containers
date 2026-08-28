# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

A collection of standalone Dockerfiles that containerize Red Team tools. There is no shared build system, package manifest, or test suite — each top-level directory is an independent, self-contained tool image with its own `Dockerfile` and `README.md`. Most directories have no other files.

## Commands

Build a tool image:
```
docker build -t <image_name> <tool_directory>
```

Run a built image:
```
docker run -it <image_name> <arguments>
```

Multi-arch build and push to Docker Hub (see `dockerhub_update.sh` for the exact invocations already used for `nmap`, `nmap-small`, `metasploit`, `wordlists`):
```
docker buildx build --platform linux/amd64,linux/arm64 -t sneakerhax/<image_name> -f <tool_directory>/Dockerfile <tool_directory>/ --push
```
Only add a new tool to `dockerhub_update.sh` if the user asks to publish it — most tool directories are build-locally-only and not listed there.

There is no lint or test command for this repo. "Testing" a change means building the image and running it against a real or scoped target.

`Pivot-lab` is the one multi-container example, driven by `docker-compose.yaml` (services `pivot-1` an SSH host on port 2222, `pivot-2` an Apache host) instead of a single Dockerfile — run it with `docker compose -f Pivot-lab/docker-compose.yaml up`.

## Adding a new tool

Follow the existing convention when adding a directory:
- Directory name matches the tool, `PascalCase` or `Title-Case` (e.g. `FFuF`, `Git-Dumper`).
- Minimal `Dockerfile`: pick the smallest sensible base (`alpine`, `python:alpine`, `python:3-slim`, `golang:alpine`) unless the tool needs Kali's package set (`kalilinux/kali-rolling`), then install just what's needed and set an `ENTRYPOINT` so the image runs like the underlying CLI tool (`docker run -it <image> <args>`).
- `README.md` per directory documenting build/run usage, matching the style of existing tool READMEs.
- Add the new tool to the `## Images` list in the root `README.md`.
- Directories suffixed `-Deprecated` (e.g. `PyDNSRecon-Deprecated`) are kept for reference but not maintained — don't build on top of them for new work; check whether a non-deprecated replacement already exists first.

## Repo-specific conventions worth knowing

- `Nmap` bundles `ncrack` in the same image and appends a `nse()` bash function (`add_nse_function`) to search installed NSE scripts by keyword; `Ncrack` reuses the same `add_nse_function` file.
- `Nmap-small` and other `-small` variants trade the Kali base for `alpine` + minimal packages when the full Kali toolset isn't needed.
- `Kali-Linux-MCP` runs `mcp-kali-server` exposed on port 5000 — an MCP server wrapping Kali tools, not a CLI entrypoint image.
- `Shodan`'s Dockerfile bakes in an API key via `ARG shodan_api_key` at build time — pass `--build-arg shodan_api_key=<key>` rather than hardcoding a real key in the Dockerfile.
- `Infra/socat-http-redirector`'s `ENTRYPOINT` has a literal `<ip_address>` placeholder that must be edited before building.
- `.github/skills/nmap/SKILL.md` defines a Claude Code skill that runs the published `sneakerhax/nmap` Docker Hub image directly against a target — prefer it over rebuilding the image locally when the user just wants a quick scan.

## Safety

Everything in this repo is Red Team tooling (scanners, C2 helpers, credential crackers, HTTP redirectors). Treat usage as intended for authorized testing/lab environments only, matching the tone of the existing READMEs (e.g. `.github/skills/nmap/SKILL.md`: "Keep scans authorized and within scope").
