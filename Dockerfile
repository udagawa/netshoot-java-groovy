FROM nicolaka/netshoot:latest

# Java 21 Temurin
RUN apk update && apk add --no-cache \
    curl \
    bash \
    unzip \
    ca-certificates \
    && mkdir -p /opt/java \
    && curl -L -o /tmp/jdk.tar.gz \
       https://github.com/adoptium/temurin21-binaries/releases/latest/download/OpenJDK21U-jdk_x64_alpine-linux_hotspot.tar.gz \
    && tar -xzf /tmp/jdk.tar.gz -C /opt/java --strip-components=1 \
    && rm /tmp/jdk.tar.gz

ENV JAVA_HOME=/opt/java
ENV PATH="${JAVA_HOME}/bin:${PATH}"

# Groovy 5
RUN mkdir -p /opt/groovy \
    && curl -L -o /tmp/groovy.zip \
       https://groovy.jfrog.io/artifactory/dist-release-local/groovy-zips/apache-groovy-binary-5.0.0-alpha-4.zip \
    && unzip /tmp/groovy.zip -d /opt/groovy \
    && mv /opt/groovy/*/* /opt/groovy \
    && rm /tmp/groovy.zip

ENV GROOVY_HOME=/opt/groovy
ENV PATH="${GROOVY_HOME}/bin:${PATH}"

ENTRYPOINT ["sleep", "infinity"]
