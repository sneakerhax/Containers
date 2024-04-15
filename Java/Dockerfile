FROM openjdk

# https://stackoverflow.com/questions/73634989/docker-image-build-failure-wget
RUN microdnf update \
 && microdnf install --nodocs wget unzip \
 && microdnf clean all \
 && rm -rf /var/cache/yum

 ENTRYPOINT [ "bash" ]
