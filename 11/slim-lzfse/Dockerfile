FROM gcc:8 as lzfse

WORKDIR /

RUN mkdir /lzfse \
    && cd /lzfse \
    && git init \
    && git fetch --depth 1 https://github.com/lzfse/lzfse.git lzfse-1.0 \
    && git checkout -q FETCH_HEAD
RUN cd /lzfse \
    && make install

FROM openjdk:11.0.10-slim
WORKDIR /

RUN apt-get update \
 && apt-get install -y \
    dumb-init

LABEL vendor="Wandera, Ltd."

# Add lzfse binary on PATH
COPY --from=lzfse /usr/local/bin/lzfse /usr/local/bin

# JVM consumes system CA certificates
COPY /docker/wandera-ca-expire-2037-03-05.crt /usr/local/share/ca-certificates/
RUN update-ca-certificates

# Use /dev/urandom instead of blocking /dev/random
RUN sed -i.bak \
  -e "s/securerandom.source=file:\/dev\/random/securerandom.source=file:\/dev\/\.\/urandom/g" \
  -e "s/securerandom.strongAlgorithms=NativePRNGBlocking/securerandom.strongAlgorithms=NativePRNG/g" \
  $JAVA_HOME/conf/security/java.security
