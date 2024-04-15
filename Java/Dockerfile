FROM openjdk

RUN microdnf update \
 && microdnf install --nodocs wget unzip \
 && microdnf clean all \
 && rm -rf /var/cache/yum

 ENTRYPOINT [ "bash" ]