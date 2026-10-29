FROM golang:alpine AS builder
RUN apk add --no-cache git build-base libpcap-dev
RUN go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest

FROM alpine:latest
RUN apk upgrade --no-cache \
    && apk add --no-cache nmap libpcap bind-tools ca-certificates nmap-scripts
COPY --from=builder /go/bin/naabu /usr/local/bin/naabu
ENTRYPOINT ["naabu"]