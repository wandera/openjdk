FROM openjdk:11-slim
WORKDIR /

RUN apt-get update \
 && apt-get install -y \
    dumb-init

LABEL vendor="Wandera, Ltd."

# JVM consumes system CA certificates
COPY /docker/wandera-ca-expire-2037-03-05.crt /usr/local/share/ca-certificates/
RUN update-ca-certificates
