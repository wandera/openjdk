FROM openjdk:11.0.5-slim
WORKDIR /

RUN apt-get update \
 && apt-get install -y \
    dumb-init

LABEL vendor="Wandera, Ltd."

# JVM consumes system CA certificates
COPY /docker/wandera-ca-expire-2037-03-05.crt /usr/local/share/ca-certificates/
RUN update-ca-certificates

# Use /dev/urandom instead of blocking /dev/random
RUN sed -i.bak \
  -e "s/securerandom.source=file:\/dev\/random/securerandom.source=file:\/dev\/\.\/urandom/g" \
  -e "s/securerandom.strongAlgorithms=NativePRNGBlocking/securerandom.strongAlgorithms=NativePRNG/g" \
  $JAVA_HOME/conf/security/java.security
