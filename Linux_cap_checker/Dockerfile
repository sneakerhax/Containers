FROM alpine

RUN apk add libcap bash
ADD dangerous_caps.sh /dangerous_caps.sh
RUN chmod +x /dangerous_caps.sh

# ENTRYPOINT [ "capsh" ]
# CMD [ "--print" ]
ENTRYPOINT [ "/dangerous_caps.sh" ]
